import 'dart:async';

import 'parser/general_video_link_parser.dart';
import 'parser/parse_result.dart';
import 'parser/parser.dart';

/// A ResourceHunter.
class ResourceHunter {
  final Map<String, Parser> _parsers;

  ///
  factory ResourceHunter() {
    final Map<String, Parser> parsers = {
      "v.qq.com": const GeneralVideoLinkParser(),
      "v.youku.com": const GeneralVideoLinkParser(),
      "www.iqiyi.com": const GeneralVideoLinkParser(),
      "www.mgtv.com": const GeneralVideoLinkParser(),
      "www.bilibili.com": const GeneralVideoLinkParser(),
      "m.v.qq.com": const GeneralVideoLinkParser(true),
      "m.iqiyi.com": const GeneralVideoLinkParser(),
      "m.youku.com": const GeneralVideoLinkParser(),
      "m.mgtv.com": const GeneralVideoLinkParser(),
      "m.bilibili.com": const GeneralVideoLinkParser(),
    };

    return ResourceHunter._internal(
      parsers,
    );
  }

  ///
  ResourceHunter._internal(
    this._parsers,
  );

  /// parse a link
  ///
  /// - [link] **String** a network address
  ///
  /// throws [Exception]
  Future<T> parseLink<T extends ParseResult>(String link) async {
    final parsedUrl = Uri.parse(link);
    final host = parsedUrl.host;

    if (!_parsers.containsKey(host)) {
      throw Exception('no support parse: $link');
    }

    final parser = _parsers[host]!;
    final result = await parser.parse(link);
    return result as T;
  }

  /// query resources
  Future<Map<String, dynamic>?> queryResources() async {
    return null;
  }

  // /// search resources
  // Future<Map<String, dynamic>?> searchResources() async {
  //   return null;
  // }
}
