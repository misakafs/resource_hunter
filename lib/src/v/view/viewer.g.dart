// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoViewRequest _$VideoViewRequestFromJson(Map<String, dynamic> json) =>
    VideoViewRequest(
      platform: json['platform'] as String? ?? '',
      cid: json['cid'] as String? ?? '',
      vid: json['vid'] as String? ?? '',
      next: json['next'] as String? ?? '',
      userAgent: json['userAgent'] as String?,
    );

Map<String, dynamic> _$VideoViewRequestToJson(VideoViewRequest instance) =>
    <String, dynamic>{
      'userAgent': instance.userAgent,
      'platform': instance.platform,
      'cid': instance.cid,
      'vid': instance.vid,
      'next': instance.next,
    };

VideoViewResponse _$VideoViewResponseFromJson(Map<String, dynamic> json) =>
    VideoViewResponse(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => VideoViewItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      next: json['next'] as String? ?? '',
      hasNextPage: json['hasNextPage'] as bool? ?? true,
    );

Map<String, dynamic> _$VideoViewResponseToJson(VideoViewResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'next': instance.next,
      'hasNextPage': instance.hasNextPage,
    };

VideoViewItem _$VideoViewItemFromJson(Map<String, dynamic> json) =>
    VideoViewItem(
      platform: json['platform'] as String? ?? '',
      pid: json['pid'] as String? ?? '',
      cid: json['cid'] as String? ?? '',
      vid: json['vid'] as String? ?? '',
      link: json['link'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      cover: json['cover'] as String? ?? '',
    );

Map<String, dynamic> _$VideoViewItemToJson(VideoViewItem instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'pid': instance.pid,
      'cid': instance.cid,
      'vid': instance.vid,
      'link': instance.link,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'cover': instance.cover,
    };
