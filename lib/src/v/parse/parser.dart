/// 解析接口
abstract class VideoParser {
  ///
  Future<VideoParseResult> parse(VideoParseParam param);

  /// 获取解析资源的唯一ID
  /// 可以用于缓存使用
  String getVid(VideoParseParam param);
}

/// 解析参数
class VideoParseParam {
  ///
  String platform;

  ///
  String link;

  /// 用户代理，
  String? userAgent;

  ///
  VideoParseParam(this.platform, this.link, [this.userAgent]);
}

/// 解析后的结果
class VideoParseResult {
  /// video platform
  String platform;

  /// video unique id
  String vid;

  /// raw link
  String raw;

  /// video cover
  String cover;

  /// video title
  String title;

  /// video labels
  List<String> labels;

  /// video info
  String info;

  /// video real link
  String url;

  /// url可使用的次数: 0 - 永久; 1 - 只能使用一次
  /// 永久可以进行缓存
  int disposable;

  /// 剧集 [[name, url]]
  List<List<String>> episodes;

  /// 解析的结果: 0 - 不能解析; 1 - 解析成功
  int status;

  ///
  VideoParseResult({
    this.platform = '',
    this.vid = '',
    this.title = '',
    this.info = '',
    this.raw = '',
    this.url = '',
    this.cover = '',
    this.labels = const [],
    this.disposable = 0,
    this.episodes = const [],
    this.status = 0,
  });

  ///
  Map<String, dynamic> toJson() => {
        "platform": platform,
        "vid": vid,
        "title": title,
        "info": info,
        "raw": raw,
        "url": url,
        "cover": cover,
        "labels": labels.map((x) => x).toList(),
        "disposable": disposable,
        "episodes": episodes.map((x) => x.map((x) => x).toList()).toList(),
        "status": status,
      };
}
