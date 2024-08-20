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

  /// 下一页参数 base64
  String next = '';

  ///
  VideoViewRequest({
    this.platform = '',
    this.cid = '',
    this.vid = '',
    this.next = '',
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

  /// 下一页参数
  String next = '';

  /// 是否有下一页
  bool hasNextPage = true;

  ///
  VideoViewResponse({
    this.items = const [],
    this.next = '',
    this.hasNextPage = true,
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

  /// 单集标题
  String title = '';

  /// 单集副标题
  String subTitle = '';

  /// 单集封面
  String cover = '';

  ///
  VideoViewItem({
    this.platform = '',
    this.pid = '',
    this.cid = '',
    this.vid = '',
    this.link = '',
    this.title = '',
    this.subTitle = '',
    this.cover = '',
  });

  ///
  factory VideoViewItem.fromJson(Map<String, dynamic> json) => _$VideoViewItemFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoViewItemToJson(this);
}
