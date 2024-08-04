import 'package:resource_hunter/src/utils/utils.dart';

import 'handler.dart';

/// 视频平台
/// 防止敏感数据被直接检索，对数据进行Base64编码
class VPlatform {
  /// platform key;
  final String key;

  /// platform name
  final String name;

  /// platform official website url
  final String site;

  /// platform tabs
  final List<VTab> tabs;

  /// 查询器
  final VideoQueryer? queryer;

  /// 搜索器
  final VideoSearcher? searcher;

  /// 解析器
  final VideoParser? parser;

  ///
  factory VPlatform(
    String key,
    String name,
    String site,
    List<VTab> tabs,
    String queryerName,
    String searcherName,
    String parserName,
  ) {
    final queryer = videoQueryers[Utils.base64decode(queryerName)];
    final searcher = videoSearchers[Utils.base64decode(searcherName)];
    final parser = videoParsers[Utils.base64decode(parserName)];

    return VPlatform._internal(
      Utils.base64decode(key),
      Utils.base64decode(name),
      Utils.base64decode(site),
      tabs,
      queryer,
      searcher,
      parser,
    );
  }

  // 私有命名构造方法，用于创建实例
  VPlatform._internal(
    this.key,
    this.name,
    this.site,
    this.tabs,
    this.queryer,
    this.searcher,
    this.parser,
  );

  ///
  List<String> get tabNames => tabs.map((value) => value.name).toList();

  ///
  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "site": site,
        "tabs": tabs,
      };
}

///
class VTab {
  /// tab key
  final String key;

  /// tab name
  final String name;

  ///
  const VTab(
    this.key,
    this.name,
  );

  ///
  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
      };
}
