// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsItemDto _$NewsItemDtoFromJson(Map<String, dynamic> json) => _NewsItemDto(
  id: (json['id'] as num).toInt(),
  newsItemId: json['newsItemId'] as String,
  title: json['title'] as String,
  subTitle1: json['subTitle1'] as String,
  subTitle2: json['subTitle2'] as String,
  subTitle3: json['subTitle3'] as String,
  approveDate: DateTime.parse(json['approveDate'] as String),
  modifyDate: DateTime.parse(json['modifyDate'] as String),
  thumbnailUrl: json['thumbnailUrl'] as String,
  originalImgUrl: json['originalImgUrl'] as String,
  aiSummary: json['aiSummary'] as String,
  plainTextContent: json['plainTextContent'] as String,
  ministerCode: json['ministerCode'] as String,
);

Map<String, dynamic> _$NewsItemDtoToJson(_NewsItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'newsItemId': instance.newsItemId,
      'title': instance.title,
      'subTitle1': instance.subTitle1,
      'subTitle2': instance.subTitle2,
      'subTitle3': instance.subTitle3,
      'approveDate': instance.approveDate.toIso8601String(),
      'modifyDate': instance.modifyDate.toIso8601String(),
      'thumbnailUrl': instance.thumbnailUrl,
      'originalImgUrl': instance.originalImgUrl,
      'aiSummary': instance.aiSummary,
      'plainTextContent': instance.plainTextContent,
      'ministerCode': instance.ministerCode,
    };

_SortDto _$SortDtoFromJson(Map<String, dynamic> json) => _SortDto(
  empty: json['empty'] as bool,
  sorted: json['sorted'] as bool,
  unsorted: json['unsorted'] as bool,
);

Map<String, dynamic> _$SortDtoToJson(_SortDto instance) => <String, dynamic>{
  'empty': instance.empty,
  'sorted': instance.sorted,
  'unsorted': instance.unsorted,
};

_PageableDto _$PageableDtoFromJson(Map<String, dynamic> json) => _PageableDto(
  pageNumber: (json['pageNumber'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
  sort: SortDto.fromJson(json['sort'] as Map<String, dynamic>),
  offset: (json['offset'] as num).toInt(),
  paged: json['paged'] as bool,
  unpaged: json['unpaged'] as bool,
);

Map<String, dynamic> _$PageableDtoToJson(_PageableDto instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'sort': instance.sort,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

_NewsPageResponse _$NewsPageResponseFromJson(Map<String, dynamic> json) =>
    _NewsPageResponse(
      content: (json['content'] as List<dynamic>)
          .map((e) => NewsItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageable: PageableDto.fromJson(json['pageable'] as Map<String, dynamic>),
      last: json['last'] as bool,
      totalPages: (json['totalPages'] as num).toInt(),
      totalElements: (json['totalElements'] as num).toInt(),
      first: json['first'] as bool,
      size: (json['size'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      sort: SortDto.fromJson(json['sort'] as Map<String, dynamic>),
      numberOfElements: (json['numberOfElements'] as num).toInt(),
      empty: json['empty'] as bool,
    );

Map<String, dynamic> _$NewsPageResponseToJson(_NewsPageResponse instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'last': instance.last,
      'totalPages': instance.totalPages,
      'totalElements': instance.totalElements,
      'first': instance.first,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };
