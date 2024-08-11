/// 查看器接口
abstract class VideoViewer {
  ///
  Future<VideoViewResult> view(VideoViewParam param);
}

///
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
  Map<String, dynamic> toJson() => {
        "platform": platform,
        "cid": cid,
        "vid": vid,
        "userAgent": userAgent,
      };
}

///
class VideoViewResult {
  /// 数据
  List<VideoViewItem> items = [];

  ///
  VideoViewResult({
    this.items = const [],
  });

  ///
  Map<String, dynamic> toJson() => {
        "items": items,
      };
}

///
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
  Map<String, dynamic> toJson() => {
        "platform": platform,
        "pid": pid,
        "cid": cid,
        "vid": vid,
        "link": link,
        "title": title,
        "seq": seq,
      };
}
