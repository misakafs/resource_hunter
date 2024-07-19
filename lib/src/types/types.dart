/// resource types
enum ResourceTypes {
  /// 视频
  video('视频');

  const ResourceTypes(this.name);

  ///
  final String name;
}

/// video resource platform
enum VideoResourcePlatform {
  ///
  qq('腾讯'),

  ///
  iqiyi('爱奇艺'),

  ///
  youku('优酷'),

  ///
  mgtv('芒果');

  const VideoResourcePlatform(this.name);

  ///
  final String name;
}

/// video resource channel
enum VideoResourceChannel {
  ///
  tv('电视剧'),

  ///
  movie('电影'),

  ///
  cartoon('动漫');

  const VideoResourceChannel(this.name);

  ///
  final String name;
}
