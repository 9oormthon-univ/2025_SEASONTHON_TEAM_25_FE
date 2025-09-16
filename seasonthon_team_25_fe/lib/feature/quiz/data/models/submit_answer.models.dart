import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_answer.models.freezed.dart';
part 'submit_answer.models.g.dart';

@freezed
abstract class SubmitAnswerRequest with _$SubmitAnswerRequest {
  const factory SubmitAnswerRequest({
    required int userQuizId,
    required String userAnswer, // OX: "true"/"false", MCQ: "1".."4"
  }) = _SubmitAnswerRequest;

  factory SubmitAnswerRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitAnswerRequestFromJson(json);
}

@freezed
abstract class SubmitAnswerResponse with _$SubmitAnswerResponse {
  const factory SubmitAnswerResponse({
    required String explanation,
    required String category, // "news" or "quiz"
    required String hint, // newsId or hint string
    required String correctAnswer, // "true"/"false" or "1".."4"
    required bool correct,
  }) = _SubmitAnswerResponse;

  factory SubmitAnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitAnswerResponseFromJson(json);
}
