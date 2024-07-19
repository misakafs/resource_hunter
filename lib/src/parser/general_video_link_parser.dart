import 'dart:convert';

import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:http/retry.dart' show RetryClient;
import 'package:random_user_agents/random_user_agents.dart';

import '../types/types.dart';
import '../utils/utils.dart';
import 'parse_result.dart';
import 'parser.dart';

/// 编码，防止被直接搜索
final _iv = utf8.decode(base64.decode("M2NjY2Y4ODE4MTQwOGYxOQ=="));
final _api = utf8.decode(base64.decode("aHR0cHM6Ly8xMjIuMjI4LjguMjk6NDQzMy94bWZsdi5qcw=="));
final _origin = utf8.decode(base64.decode("aHR0cHM6Ly9qeC54bWZsdi5jb20="));

final _cache = utf8.decode(base64.decode("aHR0cHM6Ly8xMjIuMjI4LjguMjk6NDQzMy9DYWNoZQ=="));

///
class GeneralVideoLinkParser implements Parser {
  final bool _keep;

  ///
  const GeneralVideoLinkParser([this._keep = false]);

  @override
  String type() {
    return ResourceTypes.video.name;
  }

  @override
  Future<ParseVideoResult> parse(String link) async {
    if (!_keep) {
      final parsedUrl = Uri.parse(link);
      link = parsedUrl.origin + parsedUrl.path;
    }
    final pid = Utils.generateMd5(link);
    final resp = await _request(link);

    final result = ParseVideoResult();
    result.pid = pid;
    result.raw = link;

    if (resp == null) {
      return result;
    }

    final aesKey = resp['aes_key'] ?? '';
    final aesIv = resp['aes_iv'] ?? '';

    final url = Utils.aesDecode(resp['url'], aesKey, aesIv).trim();
    final html = Utils.aesDecode(resp['html'], aesKey, aesIv);
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

    result.disposable = url.startsWith(_cache) ? 1 : 0;
    result.status = 1;

    return result;
  }

  String _getSign(int t, String link) {
    final a = Utils.generateMd5("$t$link");
    final key = Utils.generateMd5(a);
    return Utils.aesEncode(a, key, _iv);
  }

  Future<Map<String, dynamic>?> _request(String link) async {
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
          'User-Agent': RandomUserAgents.random(),
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
      );
      if (response.statusCode != 200) {
        print('request failed: ${response.statusCode}, ${response.body}');
        return null;
      }
      return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    } catch (e, stackTrace) {
      Utils.log('parse link error', e, stackTrace);
    } finally {
      client.close();
    }
    return null;
  }
}
