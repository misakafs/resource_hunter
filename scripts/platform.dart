import 'dart:io';

import 'package:resource_hunter/src/utils/utils.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

/// 配置文件位置
const _platformConfigPath = 'config/platform.yaml';

/// 解析后的配置文件位置
const _decodePlatformConfigPath = 'dist/platform.yaml';

/// 生成后的文件位置
const _createPlatformPath = 'lib/src/v/platform.dart';

/// 解码：dart run scripts/platform.dart decode
/// 编码：dart run scripts/platform.dart encode
/// 生成：dart run scripts/platform.dart create
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    throw '参数为空';
  }
  switch (arguments[0]) {
    case 'decode':
      _decode();
      break;
    case 'encode':
      _encode();
      break;
    case 'create':
      _create();
      break;
    default:
      throw '参数错误';
  }
}

/// 读取配置文件
PlatformConfig _readConfig(String configPath) {
  final file = File(configPath);
  if (!file.existsSync()) {
    throw Exception('$configPath 文件不存在');
  }
  final yamlString = file.readAsStringSync();
  final yamlMap = loadYaml(yamlString);

  final Map<String, dynamic> mutableMap = Map.from(yamlMap);

  return PlatformConfig.fromYaml(mutableMap);
}

/// 解码
void _decode() {
  final file = File(_decodePlatformConfigPath);
  // 检查目录是否存在
  if (!file.parent.existsSync()) {
    // 目录不存在，创建目录
    file.parent.createSync(recursive: true);
  }

  final pc = _readConfig(_platformConfigPath);
  for (var i = 0; i < pc.platforms!.length; i++) {
    pc.platforms![i].key = Utils.base64decode(pc.platforms![i].key!);
    pc.platforms![i].name = Utils.base64decode(pc.platforms![i].name!);
    pc.platforms![i].site = Utils.base64decode(pc.platforms![i].site!);

    pc.platforms![i].queryer = Utils.base64decode(pc.platforms![i].queryer!);
    pc.platforms![i].searcher = Utils.base64decode(pc.platforms![i].searcher!);
    pc.platforms![i].parser = Utils.base64decode(pc.platforms![i].parser!);
  }
  final yamlMap = pc.toJson();
  final yamlWriter = YamlWriter();
  final y = yamlWriter.write(yamlMap);

  file.writeAsStringSync(y);
  print('解码完成，查看文件: $_decodePlatformConfigPath');
}

/// 编码
void _encode() {
  final file = File(_platformConfigPath);
  // 检查目录是否存在
  if (!file.parent.existsSync()) {
    // 目录不存在，创建目录
    file.parent.createSync(recursive: true);
  }

  final pc = _readConfig(_decodePlatformConfigPath);

  pc.version = DateTime.now().millisecondsSinceEpoch.toString();

  for (var i = 0; i < pc.platforms!.length; i++) {
    pc.platforms![i].key = Utils.base64encode(pc.platforms![i].key!);
    pc.platforms![i].name = Utils.base64encode(pc.platforms![i].name!);
    pc.platforms![i].site = Utils.base64encode(pc.platforms![i].site!);

    pc.platforms![i].queryer = Utils.base64encode(pc.platforms![i].queryer!);
    pc.platforms![i].searcher = Utils.base64encode(pc.platforms![i].searcher!);
    pc.platforms![i].parser = Utils.base64encode(pc.platforms![i].parser!);
  }

  final yamlMap = pc.toJson();
  final yamlWriter = YamlWriter();
  final y = yamlWriter.write(yamlMap);

  file.writeAsStringSync(y);
  print('编码完成，查看文件: $_platformConfigPath');
}

/// 生成
void _create() {
  final pc = _readConfig(_platformConfigPath);

  final now = DateTime.now().toString();

  List<String> platforms = [];
  List<String> platformNames = [];

  pc.platforms?.forEach((p) {
    if (p.enable == null || p.enable == false) {
      return;
    }

    final name = Utils.base64decode(p.key!);

    platformNames.add('$name,');

    List<String> tabs = [];

    p.tabs?.forEach((t) {
      tabs.add("VTab('${t.key}', '${t.name}'),");
    });

    platforms.add("""final $name = VPlatform(
    '${p.key}',
    '${p.name}',
    '${p.site}',
    const [
      ${tabs.join('\n')}
    ],
    '${p.queryer}',
    '${p.searcher}',
    '${p.parser}',
  );""");
  });

  final content = """/// 该文件是由脚本生成，不需要改动
/// 生成脚本命令: dart run scripts/platform.dart create
/// 生成时间: $now
/// version: ${pc.version}
part of 'video_platform.dart';

class _VideoPlatform {
  ${platforms.join('\n\n')}

  /// 获取所有支持的平台
  List<VPlatform> get platforms => [
        ${platformNames.join('\n')}
      ];

  /// 获取所有平台的名字
  List<String> get platformNames => platforms.map((value) => value.name).toList();
  
  /// 根据link匹配对应的平台
  VPlatform? linkMatchPlatform(String link) {
    return platforms.firstWhere((value) => link.contains('\${value.key}.com'));
  }
}""";

  final file = File(_createPlatformPath);

  file.writeAsStringSync(content);

  Process.run('dart', ['format', _createPlatformPath]).then((value) {
    print('文件生成成功: $_createPlatformPath');
  });
}

/// ---------------------------------------------- 对象 ----------------------------------------------

class PlatformConfig {
  String? version;
  List<Platform>? platforms;

  PlatformConfig({this.version, this.platforms});

  factory PlatformConfig.fromYaml(Map<String, dynamic> m) {
    final List<Platform> platforms = [];
    if (m['platforms'] != null) {
      m['platforms'].forEach((v) {
        final Map<String, dynamic> mutableMap = Map.from(v);
        platforms.add(Platform.fromYaml(mutableMap));
      });
    }
    return PlatformConfig(
      version: m['version'] as String,
      platforms: platforms,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['version'] = version;
    if (platforms != null) {
      data['platforms'] = platforms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Platform {
  String? key;
  String? name;
  bool? enable;
  String? site;
  List<Tab>? tabs;
  String? queryer;
  String? searcher;
  String? parser;

  Platform({
    this.key,
    this.name,
    this.enable,
    this.site,
    this.tabs,
    this.queryer,
    this.searcher,
    this.parser,
  });

  factory Platform.fromYaml(Map<String, dynamic> m) {
    final List<Tab> tabs = [];
    if (m['tabs'] != null) {
      m['tabs'].forEach((v) {
        final Map<String, dynamic> mutableMap = Map.from(v);
        tabs.add(Tab.fromYaml(mutableMap));
      });
    }
    return Platform(
      key: m['key'] as String,
      name: m['name'] as String,
      enable: m['enable'] as bool,
      site: m['site'] as String,
      tabs: tabs,
      queryer: m['queryer'] as String,
      searcher: m['searcher'] as String,
      parser: m['parser'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['key'] = key;
    data['name'] = name;
    data['enable'] = enable;
    data['site'] = site;
    if (tabs != null) {
      data['tabs'] = tabs!.map((v) => v.toJson()).toList();
    }
    data['queryer'] = queryer;
    data['searcher'] = searcher;
    data['parser'] = parser;
    return data;
  }
}

class Tab {
  String? key;
  String? name;

  Tab({this.key, this.name});

  factory Tab.fromYaml(Map<String, dynamic> m) {
    return Tab(
      key: m['key'] as String,
      name: m['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['key'] = key;
    data['name'] = name;
    return data;
  }
}
