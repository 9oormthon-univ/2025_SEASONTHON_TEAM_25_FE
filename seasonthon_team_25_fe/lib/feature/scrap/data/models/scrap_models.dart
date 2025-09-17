import 'package:freezed_annotation/freezed_annotation.dart';

part 'scrap_models.freezed.dart';
part 'scrap_models.g.dart';

/// 스크랩 등록/해제 응답 모델
@freezed
abstract class ScrapResponse with _$ScrapResponse {
  const factory ScrapResponse({
    required int newsArticleId,
    required String message,
    String? achievementType,
    required bool achievementCreated,
    required bool scraped,
  }) = _ScrapResponse;

  factory ScrapResponse.fromJson(Map<String, dynamic> json) =>
      _$ScrapResponseFromJson(json);
}

/// 스크랩된 뉴스 아이템 모델
@freezed
abstract class ScrapNewsItem with _$ScrapNewsItem {
  const factory ScrapNewsItem({
    required int newsArticleId,
    required String scrappedDate,
    required String title,
    required String aiSummary,
    required String thumbnailUrl,
    required String approveDate,
    required bool scraped,
  }) = _ScrapNewsItem;

  factory ScrapNewsItem.fromJson(Map<String, dynamic> json) =>
      _$ScrapNewsItemFromJson(json);
}

/// 스크랩 목록 페이지 응답 모델
@freezed
abstract class ScrapNewsPageResponse with _$ScrapNewsPageResponse {
  const factory ScrapNewsPageResponse({
    required int page,
    required List<ScrapNewsItem> content,
    required int size,
    required int totalElements,
    required int totalPages,
    required bool first,
    required bool last,
    required bool hasNext,
    required bool hasPrevious,
  }) = _ScrapNewsPageResponse;

  factory ScrapNewsPageResponse.fromJson(Map<String, dynamic> json) =>
      _$ScrapNewsPageResponseFromJson(json);
}