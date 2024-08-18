import 'package:json_annotation/json_annotation.dart';

part 'searcher.g.dart';

/// 搜索列表接口
abstract class VideoSearcher {
  ///
  Future<VideoSearchResponse> search(VideoSearchRequest req);
}

///
@JsonSerializable()
class VideoSearchRequest {
  /// 每页条数
  int size = 20;

  /// 当前页, 0 是第一页
  int current = 0;

  /// 平台
  String platform = '';

  /// 搜索关键字
  String keyword = '';

  ///
  String? userAgent;

  /// VideoSearchParam
  VideoSearchRequest({
    this.current = 0,
    this.size = 20,
    this.platform = '',
    this.keyword = '',
    this.userAgent = '',
  });

  ///
  factory VideoSearchRequest.fromJson(Map<String, dynamic> json) => _$VideoSearchRequestFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoSearchRequestToJson(this);
}

///
@JsonSerializable()
class VideoSearchResponse {
  /// 是否还有下一页
  bool hasNext = false;

  /// 数据
  List<VideoSearchItem> items = [];

  ///
  VideoSearchResponse({
    this.hasNext = false,
    this.items = const [],
  });

  ///
  factory VideoSearchResponse.fromJson(Map<String, dynamic> json) => _$VideoSearchResponseFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoSearchResponseToJson(this);
}

///
@JsonSerializable()
class VideoSearchItem {
  /// 平台
  String platform = '';

  /// 频道
  String channel = '';

  /// 视频网站
  String link = '';

  /// id
  String cid = '';

  /// 竖版封面
  String coverVt = '';

  /// 标题
  String title = '';

  /// 副标题
  String subTitle = '';

  /// 描述
  String info = '';

  /// 年份
  String year = '';

  /// 语言
  String language = '';

  /// 地区
  String area = '';

  /// 主演
  String actors = '';

  ///
  VideoSearchItem({
    this.platform = '',
    this.channel = '',
    this.link = '',
    this.cid = '',
    this.coverVt = '',
    this.title = '',
    this.subTitle = '',
    this.info = '',
    this.year = '',
    this.language = '',
    this.area = '',
    this.actors = '',
  });

  ///
  factory VideoSearchItem.fromJson(Map<String, dynamic> json) => _$VideoSearchItemFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoSearchItemToJson(this);
}
