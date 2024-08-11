import 'package:resource_hunter/src/utils/error.dart';
import 'package:resource_hunter/src/v/parse/parser.dart';
import 'package:resource_hunter/src/v/query/querier.dart';
import 'package:resource_hunter/src/v/search/searcher.dart';
import 'package:resource_hunter/src/v/v_platform.dart';
import 'package:resource_hunter/src/v/view/viewer.dart';

part 'platform.dart';

/// 视频平台合集
class VideoPlatform extends _VideoPlatform {
  /// user agent
  final String? userAgent;

  ///
  VideoPlatform({
    this.userAgent,
  });

  /// 解析链接
  Future<VideoParseResult> parse(String link) async {
    final p = linkMatchPlatform(link);
    if (p == null) {
      throw ResourceHunterException('暂不支持解析 $link');
    }
    return p.parser!.parse(VideoParseParam(p.name, link, userAgent));
  }

  /// 按条件分页查询
  Future<VideoQueryResult> query(VideoQueryParam param) async {
    final p = getPlatform(param.platform);
    if (p == null) {
      throw ResourceHunterException('暂不支持平台 ${param.platform}');
    }
    return p.querier!.query(param);
  }

  /// 按条件搜索
  Future<VideoSearchResult> search(VideoSearchParam param) async {
    final p = getPlatform(param.platform);
    if (p == null) {
      throw ResourceHunterException('暂不支持平台 ${param.platform}');
    }
    return p.searcher!.search(param);
  }

  /// 查询单条记录
  Future<VideoViewResult> view(VideoViewParam param) async {
    final p = getPlatform(param.platform);
    if (p == null) {
      throw ResourceHunterException('暂不支持平台 ${param.platform}');
    }
    if (param.cid.isEmpty) {
      throw ResourceHunterException('参数cid不能为空');
    }
    return p.viewer!.view(param);
  }
}
