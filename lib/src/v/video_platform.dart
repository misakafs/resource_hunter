import 'package:resource_hunter/src/utils/error.dart';
import 'package:resource_hunter/src/v/parse/parser.dart';
import 'package:resource_hunter/src/v/v_platform.dart';

part 'platform.dart';

/// 视频平台合集
class VideoPlatform extends _VideoPlatform {
  /// 获取解析资源的唯一ID
  /// 可以用于缓存使用
  String getVid(String link) {
    final p = linkMatchPlatform(link);
    if (p == null) {
      return '';
    }
    return p.parser!.getVid(VideoParseParam(p.key, link));
  }

  ///
  Future<VideoParseResult> parse(String link, {String? userAgent}) async {
    final p = linkMatchPlatform(link);
    if (p == null) {
      throw ResourceHunterException('暂不支持解析 $link');
    }
    return p.parser!.parse(VideoParseParam(p.key, link, userAgent));
  }
}
