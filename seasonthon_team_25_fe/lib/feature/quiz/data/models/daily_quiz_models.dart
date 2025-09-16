import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_quiz_models.freezed.dart';
part 'daily_quiz_models.g.dart';

@JsonEnum(alwaysCreate: true)
enum QuizType {
  @JsonValue('MCQ')
  mcq,
  @JsonValue('OX')
  ox,
}

extension QuizTypeX on QuizType {
  bool get isMcq => this == QuizType.mcq;
  bool get isOx => this == QuizType.ox;
}

@freezed
abstract class DailyQuizItem with _$DailyQuizItem {
  const factory DailyQuizItem({
    required int userQuizId,
    required int quizId,
    required QuizType type,
    required String question,
    @Default(<String>[]) List<String> mcqOptions, // 기본값 설정
  }) = _DailyQuizItem;

  factory DailyQuizItem.fromJson(Map<String, dynamic> json) =>
      _$DailyQuizItemFromJson(json);
}

@freezed
abstract class DailyQuizResponse with _$DailyQuizResponse {
  const factory DailyQuizResponse({
    required List<DailyQuizItem> quizzes,
    required bool completed,
  }) = _DailyQuizResponse;

  factory DailyQuizResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyQuizResponseFromJson(json);
}

@freezed
abstract class ApiErrorResponse with _$ApiErrorResponse {
  const factory ApiErrorResponse({
    required String code,
    required String message,
    required DateTime timestamp,
  }) = _ApiErrorResponse;

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);
}
