// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrap_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScrapResponse _$ScrapResponseFromJson(Map<String, dynamic> json) =>
    _ScrapResponse(
      newsArticleId: (json['newsArticleId'] as num).toInt(),
      message: json['message'] as String,
      achievementType: json['achievementType'] as String?,
      achievementCreated: json['achievementCreated'] as bool,
      scraped: json['scraped'] as bool,
    );

Map<String, dynamic> _$ScrapResponseToJson(_ScrapResponse instance) =>
    <String, dynamic>{
      'newsArticleId': instance.newsArticleId,
      'message': instance.message,
      'achievementType': instance.achievementType,
      'achievementCreated': instance.achievementCreated,
      'scraped': instance.scraped,
    };

_ScrapNewsItem _$ScrapNewsItemFromJson(Map<String, dynamic> json) =>
    _ScrapNewsItem(
      newsArticleId: (json['newsArticleId'] as num).toInt(),
      scrappedDate: json['scrappedDate'] as String,
      title: json['title'] as String,
      aiSummary: json['aiSummary'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      approveDate: json['approveDate'] as String,
      scraped: json['scraped'] as bool,
    );

Map<String, dynamic> _$ScrapNewsItemToJson(_ScrapNewsItem instance) =>
    <String, dynamic>{
      'newsArticleId': instance.newsArticleId,
      'scrappedDate': instance.scrappedDate,
      'title': instance.title,
      'aiSummary': instance.aiSummary,
      'thumbnailUrl': instance.thumbnailUrl,
      'approveDate': instance.approveDate,
      'scraped': instance.scraped,
    };

_ScrapNewsPageResponse _$ScrapNewsPageResponseFromJson(
  Map<String, dynamic> json,
) => _ScrapNewsPageResponse(
  page: (json['page'] as num).toInt(),
  content: (json['content'] as List<dynamic>)
      .map((e) => ScrapNewsItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  size: (json['size'] as num).toInt(),
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  first: json['first'] as bool,
  last: json['last'] as bool,
  hasNext: json['hasNext'] as bool,
  hasPrevious: json['hasPrevious'] as bool,
);

Map<String, dynamic> _$ScrapNewsPageResponseToJson(
  _ScrapNewsPageResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'content': instance.content,
  'size': instance.size,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'first': instance.first,
  'last': instance.last,
  'hasNext': instance.hasNext,
  'hasPrevious': instance.hasPrevious,
};
