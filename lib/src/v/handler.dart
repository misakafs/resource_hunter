import 'package:resource_hunter/src/v/parse/general_parser.dart';
import 'package:resource_hunter/src/v/parse/parser.dart';
import 'package:resource_hunter/src/v/query/queryer.dart';
import 'package:resource_hunter/src/v/search/searcher.dart';

export 'parse/parser.dart' show VideoParser;
export 'query/queryer.dart' show VideoQueryer;
export 'search/searcher.dart' show VideoSearcher;

///
final Map<String, VideoParser> videoParsers = {
  'general': const GeneralParser(),
  'general2': const GeneralParser(true),
};

///
final Map<String, VideoQueryer> videoQueryers = {};

///
final Map<String, VideoSearcher> videoSearchers = {};
