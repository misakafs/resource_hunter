// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoParseParam _$VideoParseParamFromJson(Map<String, dynamic> json) =>
    VideoParseParam(
      json['platform'] as String,
      json['link'] as String,
      json['userAgent'] as String?,
    );

Map<String, dynamic> _$VideoParseParamToJson(VideoParseParam instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'link': instance.link,
      'userAgent': instance.userAgent,
    };

VideoParseResult _$VideoParseResultFromJson(Map<String, dynamic> json) =>
    VideoParseResult(
      platform: json['platform'] as String? ?? '',
      pid: json['pid'] as String? ?? '',
      title: json['title'] as String? ?? '',
      info: json['info'] as String? ?? '',
      link: json['link'] as String? ?? '',
      cover: json['cover'] as String? ?? '',
      url: json['url'] as String? ?? '',
      disposable: (json['disposable'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$VideoParseResultToJson(VideoParseResult instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'pid': instance.pid,
      'title': instance.title,
      'info': instance.info,
      'link': instance.link,
      'cover': instance.cover,
      'url': instance.url,
      'disposable': instance.disposable,
      'status': instance.status,
    };
