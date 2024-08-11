import 'package:resource_hunter/src/v/parse/general_parser.dart';
import 'package:resource_hunter/src/v/parse/parser.dart';
import 'package:resource_hunter/src/v/query/qq_querier.dart';
import 'package:resource_hunter/src/v/query/querier.dart';
import 'package:resource_hunter/src/v/search/qq_searcher.dart';
import 'package:resource_hunter/src/v/search/searcher.dart';
import 'package:resource_hunter/src/v/view/qq_viewer.dart';
import 'package:resource_hunter/src/v/view/viewer.dart';

export 'parse/parser.dart' show VideoParser;
export 'query/querier.dart' show VideoQuerier;
export 'search/searcher.dart' show VideoSearcher;
export 'view/viewer.dart' show VideoViewer;

/// 解析器
final Map<String, VideoParser> videoParsers = {
  'general': GeneralParser(),
};

/// 查询器
final Map<String, VideoQuerier> videoQueriers = {
  'qq': QqVideoQuerier(),
};

/// 搜索器
final Map<String, VideoSearcher> videoSearchers = {
  'qq': QqSearcher(),
};

/// 查看器
final Map<String, VideoViewer> videoViewers = {
  'qq': QqViewer(),
};
