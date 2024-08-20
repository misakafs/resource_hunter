import 'package:json_path/json_path.dart';
import 'package:random_user_agents/random_user_agents.dart';
import 'package:resource_hunter/src/extension/index.dart';
import 'package:resource_hunter/src/utils/error.dart';
import 'package:resource_hunter/src/utils/http.dart';
import 'package:resource_hunter/src/utils/utils.dart';
import 'package:resource_hunter/src/v/query/querier.dart';
import 'package:resource_hunter/src/v/v_tool.dart';

final _api = Utils.base64decode(
    "aHR0cHM6Ly9wYmFjY2Vzcy52aWRlby5xcS5jb20vdHJwYy51bml2ZXJzYWxfYmFja2VuZF9zZXJ2aWNlLnBhZ2Vfc2VydmVyX3JwYy5QYWdlU2VydmVyL0dldFBhZ2VEYXRhP3ZwbGF0Zm9ybT0yJnZ2ZXJzaW9uX25hbWU9OC45LjEwJm5ld19tYXJrX2xhYmVsX2VuYWJsZWQ9MSZ2aWRlb19hcHBpZD0xMDAwMDA1");
final _origin = Utils.base64decode("aHR0cHM6Ly92LnFxLmNvbQ==");
final _vUrl = Utils.base64decode('aHR0cHM6Ly92LnFxLmNvbS94L2NvdmVyLw==');

final _nextPageContextJsonPath = JsonPath(r"$.data.next_page_context");

final _hasNextPageContextJsonPath = JsonPath(r"$.data.has_next_page");

final _itemsJsonPath = JsonPath(
  r"$.data.module_list_datas[-1].module_datas[0].item_data_lists.item_datas[?@.item_type == '2'].item_params",
);

final _channels = {
  'tv': '100113',
  'movie': '100173',
  'cartoon': '100119',
  'variety': '100109',
  'doco': '100105',
  'child': '100150',
  'minidrama': '110755',
};

///
class QqVideoQuerier extends VideoQuerier {
  @override
  Future<VideoQueryResponse> query(VideoQueryRequest req) async {
    final resp = await _request(req);

    final next = Utils.base64encode(Utils.toJsonString(_nextPageContextJsonPath.readValues(resp).first));

    final hasNextPage = (_hasNextPageContextJsonPath.readValues(resp).firstOrNull ?? true) as bool;

    List<VideoQueryItem> items = [];

    _itemsJsonPath.read(resp).toList().forEach((v) {
      if (v.value == null) {
        return;
      }

      final m = v.value as Map<String, dynamic>;

      final cid = m.getString('cid');

      if (cid.isEmpty) {
        return;
      }

      final link = '$_vUrl$cid.html';
      final pid = VTool.getPid(req.platform, link);
      final coverHz = m.getString('new_pic_hz');
      final coverVt = m.getString('new_pic_vt');
      final title = m.getString('title');
      final subTitle = m.getString('second_title');
      final timeLong = m.getString('timelong');
      final year = m.getString('year');
      final genre = m.getString('main_genre');
      final language = m.getString('langue', m.getString('dialogue'));
      final area = m.getString('area_name');
      final actors = m.getString('sub_title');

      items.add(VideoQueryItem(
        platform: req.platform,
        channel: req.channel,
        link: link,
        pid: pid,
        cid: cid,
        coverHz: coverHz,
        coverVt: coverVt,
        title: title,
        subTitle: subTitle,
        timeLong: timeLong,
        year: year,
        genre: genre,
        language: language,
        area: area,
        actors: actors,
      ));
    });

    return VideoQueryResponse(
      next: next,
      hasNextPage: hasNextPage && items.isNotEmpty,
      items: items,
    );
  }

  Future<Map<String, dynamic>?> _request(VideoQueryRequest req) async {
    final headers = {
      'origin': _origin,
      'referer': _origin,
      'content-type': 'application/json',
      'accept': 'application/json',
      'user-agent': req.userAgent ?? RandomUserAgents.random(),
    };
    final Map<String, dynamic> body = {
      "page_params": {
        "channel_id": _channels[req.channel],
        "filter_params": "sort=75",
        "page_size": "${req.size}",
        "page_type": "channel_operation",
        "page_id": "channel_list_second_page",
      },
    };
    if (req.next.isNotEmpty) {
      final next = Utils.base64decode(req.next);
      body["page_context"] = Utils.toObj(next);
    }

    try {
      return await Http.post(_api, headers: headers, body: body);
    } catch (e, stackTrace) {
      throw ResourceHunterException('查询异常: ${req.platform} >> ${e.toString()}', stackTrace);
    }
  }
}
