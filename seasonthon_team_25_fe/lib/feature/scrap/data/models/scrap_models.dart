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

/// 퀴즈 스크랩 요청 모델
@freezed
abstract class QuizScrapRequest with _$QuizScrapRequest {
  const factory QuizScrapRequest({
    required int userQuizId,
    required bool isCorrect,
  }) = _QuizScrapRequest;

  factory QuizScrapRequest.fromJson(Map<String, dynamic> json) =>
      _$QuizScrapRequestFromJson(json);
}

/// 퀴즈 스크랩 응답 모델
@freezed
abstract class QuizScrapResponse with _$QuizScrapResponse {
  const factory QuizScrapResponse({
    required int userQuizId,
    bool? isCorrectAtScrap,
    required String message,
    String? achievementType,
    required bool achievementCreated,
    required bool scraped,
  }) = _QuizScrapResponse;

  factory QuizScrapResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizScrapResponseFromJson(json);
}

/// 스크랩된 퀴즈 아이템 모델
@freezed
abstract class ScrapQuizItem with _$ScrapQuizItem {
  const factory ScrapQuizItem({
    required int userQuizId,
    int? quizId,
    required String scrappedDate,
    required String quizDate,
    required String quizType,
    required String difficulty,
    required String category,
    required String question,
    required String explanation,
    required bool isCorrectAtScrap,
    required String userAnswer,
    dynamic oxAnswer,
    String? mcqOption1,
    String? mcqOption2,
    String? mcqOption3,
    String? mcqOption4,
    int? mcqCorrectIndex,
    required bool scraped,
  }) = _ScrapQuizItem;

  factory ScrapQuizItem.fromJson(Map<String, dynamic> json) =>
      _$ScrapQuizItemFromJson(json);
}

/// 스크랩된 퀴즈 목록 페이지 응답 모델
@freezed
abstract class ScrapQuizPageResponse with _$ScrapQuizPageResponse {
  const factory ScrapQuizPageResponse({
    required int page,
    required List<ScrapQuizItem> content,
    required int size,
    required int totalElements,
    required int totalPages,
    required bool first,
    required bool last,
    required bool hasNext,
    required bool hasPrevious,
  }) = _ScrapQuizPageResponse;

  factory ScrapQuizPageResponse.fromJson(Map<String, dynamic> json) =>
      _$ScrapQuizPageResponseFromJson(json);
}
