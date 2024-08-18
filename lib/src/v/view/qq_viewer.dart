import 'package:json_path/json_path.dart';
import 'package:random_user_agents/random_user_agents.dart';
import 'package:resource_hunter/src/extension/index.dart';
import 'package:resource_hunter/src/utils/error.dart';
import 'package:resource_hunter/src/utils/http.dart';
import 'package:resource_hunter/src/utils/utils.dart';
import 'package:resource_hunter/src/v/v_tool.dart';
import 'package:resource_hunter/src/v/view/viewer.dart';

final _api = Utils.base64decode(
    "aHR0cHM6Ly9wYmFjY2Vzcy52aWRlby5xcS5jb20vdHJwYy51bml2ZXJzYWxfYmFja2VuZF9zZXJ2aWNlLnBhZ2Vfc2VydmVyX3JwYy5QYWdlU2VydmVyL0dldFBhZ2VEYXRhP3ZpZGVvX2FwcGlkPTMwMDAwMTAmdnBsYXRmb3JtPTImdnZlcnNpb25fbmFtZT04LjIuOTY=");
final _prefix = Utils.base64decode("aHR0cHM6Ly92LnFxLmNvbS94L2NvdmVyLw==");
final _origin = Utils.base64decode("aHR0cHM6Ly92LnFxLmNvbQ==");

final _itemsJsonPath = JsonPath(
  r"$.data.module_list_datas[-1].module_datas[0].item_data_lists.item_datas..item_params",
);

///
class QqViewer extends VideoViewer {
  @override
  Future<VideoViewResponse> view(VideoViewRequest req) async {
    final resp = await _request(req);

    List<VideoViewItem> items = [];

    var i = 0;
    _itemsJsonPath.read(resp).toList().forEach((v) {
      final m = v.value as Map<String, dynamic>;

      final title = m.getString('union_title');

      if (title.startsWith('预告片')) {
        return;
      }

      final cid = m.getString('cid');
      final vid = m.getString('vid');

      final link = '$_prefix$cid/$vid.html';
      final pid = VTool.getPid(req.platform, link);

      items.add(VideoViewItem(
        platform: req.platform,
        pid: pid,
        cid: cid,
        vid: vid,
        link: link,
        title: title,
        seq: i,
      ));

      i += 1;
    });

    return VideoViewResponse(
      items: items,
    );
  }

  Future<Map<String, dynamic>?> _request(VideoViewRequest req) async {
    final headers = {
      'origin': _origin,
      'referer': _origin,
      'content-type': 'application/json',
      'accept': 'application/json',
      'user-agent': req.userAgent ?? RandomUserAgents.random(),
    };
    final Map<String, dynamic> body = {
      "page_params": {
        "req_from": "web_vsite",
        "page_id": "vsite_eco_episode_list",
        "page_type": "detail_operation",
        "id_type": "1",
        "page_size": "",
        "cid": req.cid,
        "vid": req.vid,
        "lid": "",
        "page_num": "",
        "page_context": "",
        "detail_page_type": "1"
      },
      "has_cache": 1
    };

    try {
      return await Http.post(_api, headers: headers, body: body);
    } catch (e, stackTrace) {
      throw ResourceHunterException('查看异常: ${req.platform} >> ${e.toString()}', stackTrace);
    }
  }
}
