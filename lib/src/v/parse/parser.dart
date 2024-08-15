import 'package:json_annotation/json_annotation.dart';

part 'parser.g.dart';

/// 解析接口
abstract class VideoParser {
  ///
  Future<VideoParseResult> parse(VideoParseParam param);
}

/// 解析参数
@JsonSerializable()
class VideoParseParam {
  /// 平台name
  String platform;

  /// 需要解析的链接
  String link;

  /// 用户代理，
  String? userAgent;

  ///
  VideoParseParam(this.platform, this.link, [this.userAgent]);

  ///
  factory VideoParseParam.fromJson(Map<String, dynamic> json) => _$VideoParseParamFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoParseParamToJson(this);
}

/// 解析后的结果
@JsonSerializable()
class VideoParseResult {
  /// video platform
  String platform;

  /// video unique id
  String pid;

  /// video title
  String title;

  /// video info
  String info;

  /// raw link
  String link;

  /// video cover
  String cover;

  /// video real link
  String url;

  /// url可使用的次数: 0 - 永久; 1 - 只能使用一次
  /// 永久可以进行缓存
  int disposable;

  /// 解析的结果: 0 - 未解析; 1 - 不能解析; 2 - 解析成功
  int status;

  ///
  VideoParseResult({
    this.platform = '',
    this.pid = '',
    this.title = '',
    this.info = '',
    this.link = '',
    this.cover = '',
    this.url = '',
    this.disposable = 0,
    this.status = 0,
  });

  ///
  factory VideoParseResult.fromJson(Map<String, dynamic> json) => _$VideoParseResultFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoParseResultToJson(this);
}
