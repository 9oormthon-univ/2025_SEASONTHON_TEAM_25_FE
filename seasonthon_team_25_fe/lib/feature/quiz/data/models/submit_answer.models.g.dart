// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_answer.models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmitAnswerRequest _$SubmitAnswerRequestFromJson(Map<String, dynamic> json) =>
    _SubmitAnswerRequest(
      userQuizId: (json['userQuizId'] as num).toInt(),
      userAnswer: json['userAnswer'] as String,
    );

Map<String, dynamic> _$SubmitAnswerRequestToJson(
  _SubmitAnswerRequest instance,
) => <String, dynamic>{
  'userQuizId': instance.userQuizId,
  'userAnswer': instance.userAnswer,
};

_SubmitAnswerResponse _$SubmitAnswerResponseFromJson(
  Map<String, dynamic> json,
) => _SubmitAnswerResponse(
  explanation: json['explanation'] as String,
  category: json['category'] as String,
  hint: json['hint'] as String,
  correctAnswer: json['correctAnswer'] as String,
  correct: json['correct'] as bool,
);

Map<String, dynamic> _$SubmitAnswerResponseToJson(
  _SubmitAnswerResponse instance,
) => <String, dynamic>{
  'explanation': instance.explanation,
  'category': instance.category,
  'hint': instance.hint,
  'correctAnswer': instance.correctAnswer,
  'correct': instance.correct,
};
