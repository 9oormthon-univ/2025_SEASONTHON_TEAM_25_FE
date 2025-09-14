import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_models.freezed.dart';
part 'news_models.g.dart';

@freezed
abstract class NewsItemDto with _$NewsItemDto {
  const factory NewsItemDto({
    required int id,
    required String newsItemId,
    required String title,
    required String subTitle1,
    required String subTitle2,
    required String subTitle3,
    required DateTime approveDate,
    required DateTime modifyDate,
    required String thumbnailUrl,
    required String aiSummary,
    required String plainTextContent,
    required String ministerCode,
  }) = _NewsItemDto;

  factory NewsItemDto.fromJson(Map<String, dynamic> json) =>
      _$NewsItemDtoFromJson(json);
}

@freezed
abstract class SortDto with _$SortDto {
  const factory SortDto({
    required bool empty,
    required bool sorted,
    required bool unsorted,
  }) = _SortDto;

  factory SortDto.fromJson(Map<String, dynamic> json) =>
      _$SortDtoFromJson(json);
}

@freezed
abstract class PageableDto with _$PageableDto {
  const factory PageableDto({
    required int pageNumber,
    required int pageSize,
    required SortDto sort,
    required int offset,
    required bool paged,
    required bool unpaged,
  }) = _PageableDto;

  factory PageableDto.fromJson(Map<String, dynamic> json) =>
      _$PageableDtoFromJson(json);
}

@freezed
abstract class NewsPageResponse with _$NewsPageResponse {
  const factory NewsPageResponse({
    required List<NewsItemDto> content,
    required PageableDto pageable,
    required bool last,
    required int totalPages,
    required int totalElements,
    required bool first,
    required int size,
    required int number,
    required SortDto sort,
    required int numberOfElements,
    required bool empty,
  }) = _NewsPageResponse;

  factory NewsPageResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsPageResponseFromJson(json);
}
