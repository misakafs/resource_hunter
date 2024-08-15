import 'package:json_annotation/json_annotation.dart';

part 'viewer.g.dart';

/// 查看器接口
abstract class VideoViewer {
  ///
  Future<VideoViewResult> view(VideoViewParam param);
}

///
@JsonSerializable()
class VideoViewParam {
  /// 用户代理，
  String? userAgent;

  /// 平台
  String platform = '';

  ///
  String cid = '';

  ///
  String vid = '';

  ///
  VideoViewParam({
    this.platform = '',
    this.cid = '',
    this.vid = '',
    this.userAgent,
  });

  ///
  factory VideoViewParam.fromJson(Map<String, dynamic> json) => _$VideoViewParamFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoViewParamToJson(this);
}

///
@JsonSerializable()
class VideoViewResult {
  /// 数据
  List<VideoViewItem> items = [];

  ///
  VideoViewResult({
    this.items = const [],
  });

  ///
  factory VideoViewResult.fromJson(Map<String, dynamic> json) => _$VideoViewResultFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoViewResultToJson(this);
}

///
@JsonSerializable()
class VideoViewItem {
  /// 平台
  String platform = '';

  ///
  String pid = '';

  ///
  String cid = '';

  ///
  String vid = '';

  ///
  String link = '';

  ///
  String title = '';

  ///
  int seq = 0;

  ///
  VideoViewItem({
    this.platform = '',
    this.pid = '',
    this.cid = '',
    this.vid = '',
    this.link = '',
    this.title = '',
    this.seq = 0,
  });

  ///
  factory VideoViewItem.fromJson(Map<String, dynamic> json) => _$VideoViewItemFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoViewItemToJson(this);
}
