/// 查询列表接口
abstract class VideoQueryer {
  ///
  Future<VideoQueryResult> query(VideoQueryParam param);
}

///
class VideoQueryParam {
  /// 下一页参数 base64
  final String next = '';
}

///
class VideoQueryResult {}
