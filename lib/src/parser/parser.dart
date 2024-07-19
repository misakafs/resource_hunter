import 'parse_result.dart';

///
abstract class Parser {
  /// Return parse resource type
  String type();

  ///
  Future<ParseResult> parse(String link);
}
