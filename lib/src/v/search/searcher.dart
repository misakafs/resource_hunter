/// 搜索列表接口
abstract class VideoSearcher {
  ///
  Future<VideoSearchResult> search(VideoSearchParam param);
}

///
class VideoSearchParam {}

///
class VideoSearchResult {}
