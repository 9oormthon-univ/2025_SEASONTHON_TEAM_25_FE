// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsDetailResponse _$NewsDetailResponseFromJson(Map<String, dynamic> json) =>
    _NewsDetailResponse(
      id: (json['id'] as num).toInt(),
      newsItemId: json['newsItemId'] as String,
      title: json['title'] as String,
      approveDate: DateTime.parse(json['approveDate'] as String),
      modifyDate: DateTime.parse(json['modifyDate'] as String),
      thumbnailUrl: json['thumbnailUrl'] as String,
      aiSummary: json['aiSummary'] as String,
      plainTextContent: json['plainTextContent'] as String,
      ministerCode: json['ministerCode'] as String,
      contentBlocks: (json['contentBlocks'] as List<dynamic>)
          .map((e) => ContentBlockResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      scraped: json['scraped'] as bool,
    );

Map<String, dynamic> _$NewsDetailResponseToJson(_NewsDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'newsItemId': instance.newsItemId,
      'title': instance.title,
      'approveDate': instance.approveDate.toIso8601String(),
      'modifyDate': instance.modifyDate.toIso8601String(),
      'thumbnailUrl': instance.thumbnailUrl,
      'aiSummary': instance.aiSummary,
      'plainTextContent': instance.plainTextContent,
      'ministerCode': instance.ministerCode,
      'contentBlocks': instance.contentBlocks,
      'scraped': instance.scraped,
    };

_ContentBlockResponse _$ContentBlockResponseFromJson(
  Map<String, dynamic> json,
) => _ContentBlockResponse(
  blockType: json['blockType'] as String,
  originalContent: json['originalContent'] as String?,
  plainContent: json['plainContent'] as String?,
  url: json['url'] as String?,
  altText: json['altText'] as String?,
  blockOrder: (json['blockOrder'] as num).toInt(),
);

Map<String, dynamic> _$ContentBlockResponseToJson(
  _ContentBlockResponse instance,
) => <String, dynamic>{
  'blockType': instance.blockType,
  'originalContent': instance.originalContent,
  'plainContent': instance.plainContent,
  'url': instance.url,
  'altText': instance.altText,
  'blockOrder': instance.blockOrder,
};
