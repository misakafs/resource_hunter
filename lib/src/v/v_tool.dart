import 'package:resource_hunter/src/utils/utils.dart';

final _channels = {
  'tv': '电视剧',
  'movie': '电影',
  'cartoon': '动漫',
  'variety': '综艺',
  'child': '少儿',
  'doco': '纪录片',
  'minidrama': '短剧',
};

final _channelNames = Map.fromEntries(_channels.entries.map((entry) {
  return MapEntry(entry.value, entry.key);
}));

/// video tool
class VTool {
  /// 获取link唯一ID
  static String getPid(String platform, String link) {
    return Utils.generateMd5(platform + link);
  }

  ///
  static String getChannelName(String channel) {
    return _channels[channel] ?? '';
  }

  ///
  static String getChannelByName(String channelName) {
    return _channelNames[channelName] ?? '';
  }
}
