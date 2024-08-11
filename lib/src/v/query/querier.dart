/// 查询列表接口
abstract class VideoQuerier {
  ///
  Future<VideoQueryResult> query(VideoQueryParam param);
}

///
class VideoQueryParam {
  /// 下一页参数 base64
  String next = '';

  /// 平台
  String platform = '';

  /// 频道
  String channel = '';

  ///
  String? userAgent;

  ///
  VideoQueryParam({
    this.next = '',
    this.platform = '',
    this.channel = '',
    this.userAgent,
  });
}

///
class VideoQueryResult {
  /// 下一页参数
  String next = '';

  /// 数据
  List<VideoQueryItem> items = [];

  ///
  VideoQueryResult({this.next = '', this.items = const []});

  ///
  Map<String, dynamic> toJson() => {
        "next": next,
        "items": items,
      };
}

///
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
  Map<String, dynamic> toJson() => {
        "platform": platform,
        "channel": channel,
        "link": link,
        "pid": pid,
        "cid": cid,
        "coverHz": coverHz,
        "coverVt": coverVt,
        "title": title,
        "subTitle": subTitle,
        "timeLong": timeLong,
        "year": year,
        "genre": genre,
        "language": language,
        "area": area,
        "actors": actors,
      };
}