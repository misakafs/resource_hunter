import 'package:json_annotation/json_annotation.dart';

part 'viewer.g.dart';

/// 查看器接口
abstract class VideoViewer {
  ///
  Future<VideoViewResponse> view(VideoViewRequest req);
}

///
@JsonSerializable()
class VideoViewRequest {
  /// 用户代理，
  String? userAgent;

  /// 平台
  String platform = '';

  ///
  String cid = '';

  ///
  String vid = '';

  ///
  VideoViewRequest({
    this.platform = '',
    this.cid = '',
    this.vid = '',
    this.userAgent,
  });

  ///
  factory VideoViewRequest.fromJson(Map<String, dynamic> json) => _$VideoViewRequestFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoViewRequestToJson(this);
}

///
@JsonSerializable()
class VideoViewResponse {
  /// 数据
  List<VideoViewItem> items = [];

  ///
  VideoViewResponse({
    this.items = const [],
  });

  ///
  factory VideoViewResponse.fromJson(Map<String, dynamic> json) => _$VideoViewResponseFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoViewResponseToJson(this);
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
