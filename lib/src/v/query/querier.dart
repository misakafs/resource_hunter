import 'package:json_annotation/json_annotation.dart';

part 'querier.g.dart';

/// 查询列表接口
abstract class VideoQuerier {
  ///
  Future<VideoQueryResponse> query(VideoQueryRequest req);
}

///
@JsonSerializable()
class VideoQueryRequest {
  /// 下一页参数 base64
  String next = '';

  /// 每页条数
  int size = 20;

  /// 平台
  String platform = '';

  /// 频道
  String channel = '';

  ///
  String? userAgent;

  ///
  VideoQueryRequest({
    this.next = '',
    this.size = 20,
    this.platform = '',
    this.channel = '',
    this.userAgent,
  });

  ///
  factory VideoQueryRequest.fromJson(Map<String, dynamic> json) => _$VideoQueryRequestFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoQueryRequestToJson(this);
}

///
@JsonSerializable()
class VideoQueryResponse {
  /// 下一页参数
  String next = '';

  /// 是否有下一页
  bool hasNextPage = true;

  /// 数据
  List<VideoQueryItem> items = [];

  ///
  VideoQueryResponse({this.next = '', this.hasNextPage = true, this.items = const []});

  ///
  factory VideoQueryResponse.fromJson(Map<String, dynamic> json) => _$VideoQueryResponseFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoQueryResponseToJson(this);
}

///
@JsonSerializable()
class VideoQueryItem {
  /// 平台
  String platform = '';

  /// 频道
  String channel = '';

  /// 视频网站
  String link = '';

  ///
  String pid = '';

  /// id
  String cid = '';

  /// 横版封面
  String coverHz = '';

  /// 竖版封面
  String coverVt = '';

  /// 标题
  String title = '';

  /// 副标题
  String subTitle = '';

  /// 时长
  String timeLong = '';

  /// 年份
  String year = '';

  /// 分类
  String genre = '';

  /// 语言
  String language = '';

  /// 地区
  String area = '';

  /// 主演
  String actors = '';

  ///
  VideoQueryItem({
    this.platform = '',
    this.channel = '',
    this.link = '',
    this.pid = '',
    this.cid = '',
    this.coverHz = '',
    this.coverVt = '',
    this.title = '',
    this.subTitle = '',
    this.timeLong = '',
    this.year = '',
    this.genre = '',
    this.language = '',
    this.area = '',
    this.actors = '',
  });

  ///
  factory VideoQueryItem.fromJson(Map<String, dynamic> json) => _$VideoQueryItemFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoQueryItemToJson(this);
}
