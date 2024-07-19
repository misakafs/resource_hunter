import '../types/types.dart';

/// parse result
class ParseResult {
  /// Return parse resource type
  String type() {
    return '';
  }

  /// Is the parsing successful
  bool success() {
    return false;
  }
}

/// parse video result
class ParseVideoResult extends ParseResult {
  /// video id = md5(raw)
  String pid = '';

  /// raw link
  String raw = '';

  /// video cover
  String cover = '';

  /// video title
  String title = '';

  /// video labels
  List<String> labels = [];

  /// video info
  String info = '';

  /// video real link
  String url = '';

  /// url可使用的次数: 0 - 永久; 1 - 只能使用一次
  int disposable = 0;

  /// 剧集 [[name, url]]
  List<List<String>> episodes = [];

  /// 解析的结果: 0 - 不能解析; 1 - 解析成功
  int status = 0;

  ///
  ParseVideoResult({
    this.pid = '',
    this.title = '',
    this.info = '',
    this.raw = '',
    this.url = '',
    this.cover = '',
    this.labels = const [],
    this.disposable = 0,
    this.episodes = const [],
    this.status = 0,
  });

  ///
  factory ParseVideoResult.fromJson(Map<String, dynamic> json) {
    return ParseVideoResult(
      pid: json["pid"],
      title: json["title"],
      info: json["info"],
      raw: json["raw"],
      url: json["url"],
      cover: json["cover"],
      labels: json["labels"] == null ? [] : List<String>.from(json["labels"]!.map((x) => x)),
      disposable: json["disposable"],
      episodes: json["episodes"] == null
          ? []
          : List<List<String>>.from(json["episodes"]!.map((x) => x == null ? [] : List<String>.from(x!.map((x) => x)))),
      status: json["status"],
    );
  }

  ///
  Map<String, dynamic> toJson() => {
        "pid": pid,
        "title": title,
        "info": info,
        "raw": raw,
        "url": url,
        "cover": cover,
        "labels": labels.map((x) => x).toList(),
        "disposable": disposable,
        "episodes": episodes.map((x) => x.map((x) => x).toList()).toList(),
        "status": status,
      };

  @override
  String type() {
    return ResourceTypes.video.name;
  }

  @override
  bool success() {
    return url.isNotEmpty && status == 0;
  }
}
