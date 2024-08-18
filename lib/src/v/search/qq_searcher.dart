import 'package:json_path/json_path.dart';
import 'package:random_user_agents/random_user_agents.dart';
import 'package:resource_hunter/src/extension/index.dart';
import 'package:resource_hunter/src/utils/error.dart';
import 'package:resource_hunter/src/utils/http.dart';
import 'package:resource_hunter/src/utils/utils.dart';
import 'package:resource_hunter/src/v/search/searcher.dart';
import 'package:resource_hunter/src/v/v_tool.dart';

final _api = Utils.base64decode(
    "aHR0cHM6Ly9wYmFjY2Vzcy52aWRlby5xcS5jb20vdHJwYy52aWRlb3NlYXJjaC5zZWFyY2hfY2dpLmh0dHAvbG9hZF9pbnRlbnRfbGlzdF9pbmZvP3ZhcHBpZD0zNDM4MjU3OSZ2c2VjcmV0PWU0OTZiMDU3NzU4YWViMDRiM2EyZDYyM2M5NTJhMWM0N2UwNGZmYjBhMDFlMTljZiZxdWVyeUZyb209NCZwbGF0Zm9ybT0yJmd1aWQ9JnByZVFpZD0mZmlsdGVyVmFsdWU9JmdfdGs9JmdfdnN0az0mZ19hY3RrPQ==");

final _origin = Utils.base64decode("aHR0cHM6Ly92LnFxLmNvbQ==");

final _totalJsonPath = JsonPath(
  r"$.data.normalList.totalNum",
);

final _itemsJsonPath = JsonPath(
  r"$.data.normalList.itemList..videoInfo",
);

final _itemsJsonPath2 = JsonPath(
  r"$.data.areaBoxList[0].itemList..videoInfo",
);

///
class QqSearcher extends VideoSearcher {
  @override
  Future<VideoSearchResponse> search(VideoSearchRequest req) async {
    final resp = await _request(req);

    final total = _totalJsonPath.readValues(resp).first as int;

    List<VideoSearchItem> items = [];

    _itemsJsonPath.read(resp).toList().forEach((v) {
      if (v.value == null) {
        return;
      }

      final m = v.value as Map<String, dynamic>;

      final item = _getVideoSearchItem(req, m);
      if (item == null) {
        return;
      }
      items.add(item);
    });

    if (items.isEmpty) {
      _itemsJsonPath2.read(resp).toList().forEach((v) {
        if (v.value == null) {
          return;
        }

        final m = v.value as Map<String, dynamic>;

        final item = _getVideoSearchItem(req, m);

        if (item == null) {
          return;
        }

        items.add(item);
      });
    }

    return VideoSearchResponse(
      hasNext: total > req.current,
      items: items,
    );
  }

  VideoSearchItem? _getVideoSearchItem(VideoSearchRequest req, Map<String, dynamic> m) {
    final subTitle = m.getString('subTitle');

    if (subTitle == '来源·外站') {
      return null;
    }
    final link = m.getString('url');

    if (link.isEmpty) {
      return null;
    }

    final channel = VTool.getChannelByName(m.getString('typeName'));
    final title = m.getString('title');

    final info = m.getString('descrip');
    final coverVt = m.getString('imgUrl');
    final year = m.getString('year');

    final cid = link.substring(25, link.length - 5);

    final actors = m.getList('actors').map((value) => value.toString()).join(' ');
    final language = m.getList('language').map((value) => value.toString()).firstOrNull ?? '';
    final area = m.getString('area');

    return VideoSearchItem(
      platform: req.platform,
      channel: channel,
      link: link,
      title: title,
      subTitle: subTitle,
      info: info,
      coverVt: coverVt,
      year: year,
      cid: cid,
      actors: actors,
      language: language,
      area: area,
    );
  }

  Future<Map<String, dynamic>?> _request(VideoSearchRequest req) async {
    final headers = {
      'origin': _origin,
      'referer': _origin,
      'content-type': 'application/json',
      'accept': 'application/json',
      'user-agent': req.userAgent ?? RandomUserAgents.random(),
    };
    final qs = {
      'pageNum': req.current,
      'pageSize': req.size,
      'query': req.keyword,
      'pageContext':
          'boxType=mainneed&intentId=MainNeed&query=${req.keyword}&session=groups%253Dip%2526groups%253Dquery_quality%2526groups%253Dvec_quality%2526module%253DMainNeed',
    };

    try {
      return await Http.get(_api, headers: headers, queryParameters: qs);
    } catch (e, stackTrace) {
      throw ResourceHunterException('搜索异常: ${req.platform} >> ${e.toString()}', stackTrace);
    }
  }
}
