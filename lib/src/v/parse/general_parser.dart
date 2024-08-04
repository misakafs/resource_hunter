import 'dart:convert';

import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:random_user_agents/random_user_agents.dart';
import 'package:resource_hunter/src/utils/utils.dart';
import 'package:resource_hunter/src/v/parse/parser.dart';

import '../../utils/error.dart';

/// 编码，防止被直接搜索
final _iv = utf8.decode(base64.decode("M2NjY2Y4ODE4MTQwOGYxOQ=="));
final _api = utf8.decode(base64.decode("aHR0cHM6Ly8xMjIuMjI4LjguMjk6NDQzMy94bWZsdi5qcw=="));
final _origin = utf8.decode(base64.decode("aHR0cHM6Ly9qeC54bWZsdi5jb20="));

final _cache = utf8.decode(base64.decode("aHR0cHM6Ly8xMjIuMjI4LjguMjk6NDQzMy9DYWNoZQ=="));

/// 通用解析器
class GeneralParser implements VideoParser {
  final bool _keep;

  ///
  const GeneralParser([this._keep = false]);

  @override
  String getVid(VideoParseParam param) {
    var link = param.link;
    if (!_keep) {
      final parsedUrl = Uri.parse(param.link);
      link = parsedUrl.origin + parsedUrl.path;
    }
    return Utils.generateMd5(param.platform + link);
  }

  @override
  Future<VideoParseResult> parse(VideoParseParam param) async {
    var link = param.link;
    if (!_keep) {
      final parsedUrl = Uri.parse(param.link);
      link = parsedUrl.origin + parsedUrl.path;
    }

    final vid = Utils.generateMd5(param.platform + link);

    final result = VideoParseResult(
      platform: param.platform,
      vid: vid,
      raw: param.link,
    );

    /// request
    final resp = await _request(param, link);
    if (resp == null) {
      return result;
    }

    print(const JsonEncoder().convert(resp));

    final aesKey = resp['aes_key'] ?? '';
    final aesIv = resp['aes_iv'] ?? '';

    final url = Utils.aesDecode(resp['url'], aesKey, aesIv).trim();
    final html = Utils.aesDecode(resp['html'], aesKey, aesIv);

    if (html.isNotEmpty) {
      final doc = parser.parse(html);

      result.url = url;
      result.cover = doc.querySelector('.cover img')?.attributes['src'] ?? '';

      result.title = doc.querySelector('.anthology-title-wrap .title')?.text.trim() ?? '';
      result.labels = doc
          .querySelectorAll('.anthology-title-wrap .subtitle')
          .where((value) => value.text.trim().isNotEmpty)
          .map((value) => value.text.trim())
          .toList();
      result.info = doc.querySelector('.title-info')?.text.replaceAll(RegExp(r'\s+'), '').toString() ?? '';
      result.episodes = doc.querySelectorAll('#listShow a').map((value) {
        final onclick = value.attributes['onclick'];
        return [value.text.trim(), onclick?.substring(40, onclick.length - 2) ?? ''];
      }).toList();
    }

    result.disposable = url.startsWith(_cache) ? 1 : 0;
    result.status = 1;

    return result;
  }

  String _getSign(int t, String link) {
    final a = Utils.generateMd5("$t$link");
    final key = Utils.generateMd5(a);
    return Utils.aesEncode(a, key, _iv);
  }

  Future<Map<String, dynamic>?> _request(VideoParseParam param, String link) async {
    final t = DateTime.now().millisecondsSinceEpoch;
    final sign = _getSign(t, link);
    final url = Utils.urlEncodeComponent(link);
    final key = Utils.urlEncodeComponent(sign);
    final body = 'wap=1&url=$url&time=$t&key=$key';

    final parsedUrl = Uri.parse(_api);

    final client = RetryClient(http.Client());

    try {
      final response = await client.post(
        parsedUrl,
        body: body,
        headers: {
          'accept': 'application/json, text/javascript, */*; q=0.01',
          'Origin': _origin,
          'User-Agent': param.userAgent ?? RandomUserAgents.random(),
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
      );
      if (response.statusCode != 200) {
        throw Exception('请求[$link]失败: ${response.statusCode}, ${response.body}');
      }
      return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    } catch (e, stackTrace) {
      throw ResourceHunterException('解析失败: ${e.toString()}', stackTrace);
    } finally {
      client.close();
    }
  }
}
