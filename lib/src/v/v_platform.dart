import 'package:resource_hunter/src/utils/utils.dart';

import 'handler.dart';

/// 视频平台
/// 防止敏感数据被直接检索，对数据进行Base64编码
class VPlatform {
  /// platform name;
  final String name;

  /// platform label
  final String label;

  /// platform official website url
  final String site;

  /// platform channels
  final List<VChannel> channels;

  /// 查看器
  final VideoViewer? viewer;

  /// 查询器
  final VideoQuerier? querier;

  /// 搜索器
  final VideoSearcher? searcher;

  /// 解析器
  final VideoParser? parser;

  ///
  factory VPlatform(
    String name,
    String label,
    String site,
    List<VChannel> channels,
    String viewerName,
    String querierName,
    String searcherName,
    String parserName,
  ) {
    final viewer = videoViewers[Utils.base64decode(viewerName)];
    final querier = videoQueriers[Utils.base64decode(querierName)];
    final searcher = videoSearchers[Utils.base64decode(searcherName)];
    final parser = videoParsers[Utils.base64decode(parserName)];

    channels = channels
        .map((value) => VChannel(
              Utils.base64decode(value.name),
              Utils.base64decode(value.label),
            ))
        .toList();

    return VPlatform._internal(
      Utils.base64decode(name),
      Utils.base64decode(label),
      Utils.base64decode(site),
      channels,
      viewer,
      querier,
      searcher,
      parser,
    );
  }

  // 私有命名构造方法，用于创建实例
  VPlatform._internal(
    this.name,
    this.label,
    this.site,
    this.channels,
    this.viewer,
    this.querier,
    this.searcher,
    this.parser,
  );

  ///
  List<String> get channelNames => channels.map((value) => value.name).toList();
}

///
class VChannel {
  /// channel name
  final String name;

  /// channel label
  final String label;

  ///
  const VChannel(
    this.name,
    this.label,
  );
}
