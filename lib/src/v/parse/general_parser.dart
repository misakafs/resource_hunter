import 'package:html/parser.dart' as parser;
import 'package:random_user_agents/random_user_agents.dart';
import 'package:resource_hunter/src/extension/index.dart';
import 'package:resource_hunter/src/utils/error.dart';
import 'package:resource_hunter/src/utils/http.dart';
import 'package:resource_hunter/src/utils/utils.dart';
import 'package:resource_hunter/src/v/parse/parser.dart';
import 'package:resource_hunter/src/v/v_tool.dart';

/// 编码，防止被直接搜索
final _iv = Utils.base64decode("M2NjY2Y4ODE4MTQwOGYxOQ==");
final _api =
    Utils.base64decode("aHR0cHM6Ly8xMjIuMjI4LjguMjk6NDQzMy94bWZsdi5qcw==");
final _origin = Utils.base64decode("aHR0cHM6Ly9qeC54bWZsdi5jb20=");

final _cache =
    Utils.base64decode("aHR0cHM6Ly8xMjIuMjI4LjguMjk6NDQzMy9DYWNoZQ==");

/// 通用解析器
class GeneralParser implements VideoParser {
  @override
  Future<VideoParseResult> parse(VideoParseParam param) async {
    final pid = VTool.getPid(param.platform, param.link);

    final result = VideoParseResult(
      platform: param.platform,
      pid: pid,
      link: param.link,
    );

    /// request
    final resp = await _request(param, param.link);
    if (resp == null) {
      return result;
    }

    final aesKey = resp.getString('aes_key');
    final aesIv = resp.getString('aes_iv');

    final url = Utils.aesDecode(resp.getString('url'), aesKey, aesIv).trim();

    final html = Utils.aesDecode(resp.getString('html'), aesKey, aesIv);

    if (html.isNotEmpty) {
      final doc = parser.parse(html);

      result.cover = doc.querySelector('.cover img')?.attributes['src'] ?? '';

      result.title =
          doc.querySelector('.anthology-title-wrap .title')?.text.trim() ?? '';
      result.info = doc
              .querySelector('.title-info')
              ?.text
              .replaceAll(RegExp(r'\s+'), '')
              .toString() ??
          '';
    }

    result.url = url;
    result.disposable = url.startsWith(_cache) ? 1 : 0;
    result.status = url.isNotEmpty ? 2 : 1;

    return result;
  }

  String _getSign(int t, String link) {
    final a = Utils.generateMd5("$t$link");
    final key = Utils.generateMd5(a);
    return Utils.aesEncode(a, key, _iv);
  }

  Future<Map<String, dynamic>?> _request(
      VideoParseParam param, String link) async {
    final t = DateTime.now().millisecondsSinceEpoch;
    final sign = _getSign(t, link);
    final url = Utils.urlEncodeComponent(link);
    final key = Utils.urlEncodeComponent(sign);
    final body = 'wap=1&url=$url&time=$t&key=$key';

    final headers = {
      'accept': 'application/json, text/javascript, */*; q=0.01',
      'Origin': _origin,
      'User-Agent': param.userAgent ?? RandomUserAgents.random(),
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    };

    try {
      final response = await Http.post(
        _api,
        body: body,
        headers: headers,
      );
      return response;
    } catch (e, stackTrace) {
      throw ResourceHunterException(
          '解析失败: $link >> ${e.toString()}', stackTrace);
    }
  }
}
