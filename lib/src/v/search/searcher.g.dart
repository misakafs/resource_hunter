// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searcher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoSearchRequest _$VideoSearchRequestFromJson(Map<String, dynamic> json) =>
    VideoSearchRequest(
      current: (json['current'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 20,
      platform: json['platform'] as String? ?? '',
      keyword: json['keyword'] as String? ?? '',
      userAgent: json['userAgent'] as String? ?? '',
    );

Map<String, dynamic> _$VideoSearchRequestToJson(VideoSearchRequest instance) =>
    <String, dynamic>{
      'size': instance.size,
      'current': instance.current,
      'platform': instance.platform,
      'keyword': instance.keyword,
      'userAgent': instance.userAgent,
    };

VideoSearchResponse _$VideoSearchResponseFromJson(Map<String, dynamic> json) =>
    VideoSearchResponse(
      hasNext: json['hasNext'] as bool? ?? false,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => VideoSearchItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$VideoSearchResponseToJson(
        VideoSearchResponse instance) =>
    <String, dynamic>{
      'hasNext': instance.hasNext,
      'items': instance.items,
    };

VideoSearchItem _$VideoSearchItemFromJson(Map<String, dynamic> json) =>
    VideoSearchItem(
      platform: json['platform'] as String? ?? '',
      channel: json['channel'] as String? ?? '',
      link: json['link'] as String? ?? '',
      cid: json['cid'] as String? ?? '',
      coverVt: json['coverVt'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subTitle: json['subTitle'] as String? ?? '',
      info: json['info'] as String? ?? '',
      year: json['year'] as String? ?? '',
      language: json['language'] as String? ?? '',
      area: json['area'] as String? ?? '',
      actors: json['actors'] as String? ?? '',
    );

Map<String, dynamic> _$VideoSearchItemToJson(VideoSearchItem instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'channel': instance.channel,
      'link': instance.link,
      'cid': instance.cid,
      'coverVt': instance.coverVt,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'info': instance.info,
      'year': instance.year,
      'language': instance.language,
      'area': instance.area,
      'actors': instance.actors,
    };
