// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'querier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoQueryRequest _$VideoQueryRequestFromJson(Map<String, dynamic> json) =>
    VideoQueryRequest(
      next: json['next'] as String? ?? '',
      size: (json['size'] as num?)?.toInt() ?? 20,
      platform: json['platform'] as String? ?? '',
      channel: json['channel'] as String? ?? '',
      userAgent: json['userAgent'] as String?,
    );

Map<String, dynamic> _$VideoQueryRequestToJson(VideoQueryRequest instance) =>
    <String, dynamic>{
      'next': instance.next,
      'size': instance.size,
      'platform': instance.platform,
      'channel': instance.channel,
      'userAgent': instance.userAgent,
    };

VideoQueryResponse _$VideoQueryResponseFromJson(Map<String, dynamic> json) =>
    VideoQueryResponse(
      next: json['next'] as String? ?? '',
      hasNextPage: json['hasNextPage'] as bool? ?? true,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => VideoQueryItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$VideoQueryResponseToJson(VideoQueryResponse instance) =>
    <String, dynamic>{
      'next': instance.next,
      'hasNextPage': instance.hasNextPage,
      'items': instance.items,
    };

VideoQueryItem _$VideoQueryItemFromJson(Map<String, dynamic> json) =>
    VideoQueryItem(
      platform: json['platform'] as String? ?? '',
      channel: json['channel'] as String? ?? '',
      link: json['link'] as String? ?? '',
      pid: json['pid'] as String? ?? '',
      cid: json['cid'] as String? ?? '',
      coverHz: json['coverHz'] as String? ?? '',
      coverVt: json['coverVt'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      timeLong: json['timeLong'] as String? ?? '',
      year: json['year'] as String? ?? '',
      genre: json['genre'] as String? ?? '',
      language: json['language'] as String? ?? '',
      area: json['area'] as String? ?? '',
      actors: json['actors'] as String? ?? '',
    );

Map<String, dynamic> _$VideoQueryItemToJson(VideoQueryItem instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'channel': instance.channel,
      'link': instance.link,
      'pid': instance.pid,
      'cid': instance.cid,
      'coverHz': instance.coverHz,
      'coverVt': instance.coverVt,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'timeLong': instance.timeLong,
      'year': instance.year,
      'genre': instance.genre,
      'language': instance.language,
      'area': instance.area,
      'actors': instance.actors,
    };
