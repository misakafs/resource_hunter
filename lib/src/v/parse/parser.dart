import 'package:json_annotation/json_annotation.dart';

part 'parser.g.dart';

/// 解析接口
abstract class VideoParser {
  ///
  Future<VideoParseResponse> parse(VideoParseRequest req);
}

/// 解析参数
@JsonSerializable()
class VideoParseRequest {
  /// 平台name
  String platform;

  /// 需要解析的链接
  String link;

  /// 用户代理，
  String? userAgent;

  ///
  VideoParseRequest(this.platform, this.link, [this.userAgent]);

  ///
  factory VideoParseRequest.fromJson(Map<String, dynamic> json) => _$VideoParseRequestFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoParseRequestToJson(this);
}

/// 解析后的结果
@JsonSerializable()
class VideoParseResponse {
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
  VideoParseResponse({
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
  factory VideoParseResponse.fromJson(Map<String, dynamic> json) => _$VideoParseResponseFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$VideoParseResponseToJson(this);
}
