/// 搜索列表接口
abstract class VideoSearcher {
  ///
  Future<VideoSearchResult> search(VideoSearchParam param);
}

///
class VideoSearchParam {
  /// 每页条数
  int size = 10;

  /// 当前页, 0 是第一页
  int current = 0;

  /// 平台
  String platform = '';

  /// 搜索关键字
  String keyword = '';

  ///
  String? userAgent;

  /// VideoSearchParam
  VideoSearchParam({
    this.current = 0,
    this.platform = '',
    this.keyword = '',
    this.userAgent = '',
  });

  ///
  Map<String, dynamic> toJson() => {
        "platform": platform,
        "keyword": keyword,
        "userAgent": userAgent,
      };
}

///
class VideoSearchResult {
  /// 是否还有下一页
  bool hasNext = false;

  /// 数据
  List<VideoSearchItem> items = [];

  ///
  VideoSearchResult({
    this.hasNext = false,
    this.items = const [],
  });

  ///
  Map<String, dynamic> toJson() => {
        "hasNext": hasNext,
        "items": items,
      };
}

///
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
  Map<String, dynamic> toJson() => {
        "platform": platform,
        "channel": channel,
        "link": link,
        "cid": cid,
        "coverVt": coverVt,
        "title": title,
        "subTitle": subTitle,
        "info": info,
        "year": year,
        "language": language,
        "area": area,
        "actors": actors,
      };
}
