// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoViewParam _$VideoViewParamFromJson(Map<String, dynamic> json) =>
    VideoViewParam(
      platform: json['platform'] as String? ?? '',
      cid: json['cid'] as String? ?? '',
      vid: json['vid'] as String? ?? '',
      userAgent: json['userAgent'] as String?,
    );

Map<String, dynamic> _$VideoViewParamToJson(VideoViewParam instance) =>
    <String, dynamic>{
      'userAgent': instance.userAgent,
      'platform': instance.platform,
      'cid': instance.cid,
      'vid': instance.vid,
    };

VideoViewResult _$VideoViewResultFromJson(Map<String, dynamic> json) =>
    VideoViewResult(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => VideoViewItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$VideoViewResultToJson(VideoViewResult instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

VideoViewItem _$VideoViewItemFromJson(Map<String, dynamic> json) =>
    VideoViewItem(
      platform: json['platform'] as String? ?? '',
      pid: json['pid'] as String? ?? '',
      cid: json['cid'] as String? ?? '',
      vid: json['vid'] as String? ?? '',
      link: json['link'] as String? ?? '',
      title: json['title'] as String? ?? '',
      seq: (json['seq'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$VideoViewItemToJson(VideoViewItem instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'pid': instance.pid,
      'cid': instance.cid,
      'vid': instance.vid,
      'link': instance.link,
      'title': instance.title,
      'seq': instance.seq,
    };
