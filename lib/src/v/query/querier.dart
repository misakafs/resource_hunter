import 'package:json_annotation/json_annotation.dart';

part 'querier.g.dart';

/// 查询列表接口
abstract class VideoQuerier {
  ///
  Future<VideoQueryResult> query(VideoQueryParam param);
}

///
@JsonSerializable()
class VideoQueryParam {
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
  VideoQueryParam({
    this.next = '',
    this.size = 20,
    this.platform = '',
    this.channel = '',
    this.userAgent,
  });

  ///
  factory VideoQueryParam.fromJson(Map<String, dynamic> json) => _$VideoQueryParamFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoQueryParamToJson(this);
}

///
@JsonSerializable()
class VideoQueryResult {
  /// 下一页参数
  String next = '';

  /// 是否有下一页
  bool hasNextPage = true;

  /// 数据
  List<VideoQueryItem> items = [];

  ///
  VideoQueryResult({this.next = '', this.hasNextPage = true, this.items = const []});

  ///
  factory VideoQueryResult.fromJson(Map<String, dynamic> json) => _$VideoQueryResultFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoQueryResultToJson(this);
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
