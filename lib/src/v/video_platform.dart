import 'package:resource_hunter/src/utils/error.dart';
import 'package:resource_hunter/src/v/parse/parser.dart';
import 'package:resource_hunter/src/v/platforms.dart';
import 'package:resource_hunter/src/v/query/querier.dart';
import 'package:resource_hunter/src/v/search/searcher.dart';
import 'package:resource_hunter/src/v/view/viewer.dart';

/// 视频平台统一处理
class VideoPlatform {
  /// user agent
  final String? userAgent;

  ///
  VideoPlatform({
    this.userAgent,
  });

  /// 解析链接
  Future<VideoParseResponse> parse(String link) async {
    final p = VideoPlatforms.linkMatchPlatform(link);
    if (p == null) {
      throw ResourceHunterException('暂不支持解析 $link');
    }
    return p.parser!.parse(VideoParseRequest(p.name, link, userAgent));
  }

  /// 按条件分页查询
  Future<VideoQueryResponse> query(VideoQueryRequest param) async {
    final p = VideoPlatforms.getPlatform(param.platform);
    if (p == null) {
      throw ResourceHunterException('暂不支持平台 ${param.platform}');
    }
    param.userAgent ??= userAgent;
    return p.querier!.query(param);
  }

  /// 按条件搜索
  Future<VideoSearchResponse> search(VideoSearchRequest param) async {
    final p = VideoPlatforms.getPlatform(param.platform);
    if (p == null) {
      throw ResourceHunterException('暂不支持平台 ${param.platform}');
    }
    param.userAgent ??= userAgent;
    return p.searcher!.search(param);
  }

  /// 查询单条记录
  Future<VideoViewResponse> view(VideoViewRequest param) async {
    final p = VideoPlatforms.getPlatform(param.platform);
    if (p == null) {
      throw ResourceHunterException('暂不支持平台 ${param.platform}');
    }
    if (param.cid.isEmpty) {
      throw ResourceHunterException('参数cid不能为空');
    }
    param.userAgent ??= userAgent;
    return p.viewer!.view(param);
  }
}
