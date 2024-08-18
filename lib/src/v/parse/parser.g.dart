// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoParseRequest _$VideoParseRequestFromJson(Map<String, dynamic> json) =>
    VideoParseRequest(
      json['platform'] as String,
      json['link'] as String,
      json['userAgent'] as String?,
    );

Map<String, dynamic> _$VideoParseRequestToJson(VideoParseRequest instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'link': instance.link,
      'userAgent': instance.userAgent,
    };

VideoParseResponse _$VideoParseResponseFromJson(Map<String, dynamic> json) =>
    VideoParseResponse(
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

Map<String, dynamic> _$VideoParseResponseToJson(VideoParseResponse instance) =>
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
