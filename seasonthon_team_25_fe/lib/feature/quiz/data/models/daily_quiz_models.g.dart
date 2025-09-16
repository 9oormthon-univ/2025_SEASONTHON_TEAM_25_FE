// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_quiz_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyQuizItem _$DailyQuizItemFromJson(Map<String, dynamic> json) =>
    _DailyQuizItem(
      userQuizId: (json['userQuizId'] as num).toInt(),
      quizId: (json['quizId'] as num).toInt(),
      type: $enumDecode(_$QuizTypeEnumMap, json['type']),
      question: json['question'] as String,
      mcqOptions:
          (json['mcqOptions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$DailyQuizItemToJson(_DailyQuizItem instance) =>
    <String, dynamic>{
      'userQuizId': instance.userQuizId,
      'quizId': instance.quizId,
      'type': _$QuizTypeEnumMap[instance.type]!,
      'question': instance.question,
      'mcqOptions': instance.mcqOptions,
    };

const _$QuizTypeEnumMap = {QuizType.mcq: 'MCQ', QuizType.ox: 'OX'};

_DailyQuizResponse _$DailyQuizResponseFromJson(Map<String, dynamic> json) =>
    _DailyQuizResponse(
      quizzes: (json['quizzes'] as List<dynamic>)
          .map((e) => DailyQuizItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$DailyQuizResponseToJson(_DailyQuizResponse instance) =>
    <String, dynamic>{
      'quizzes': instance.quizzes,
      'completed': instance.completed,
    };

_ApiErrorResponse _$ApiErrorResponseFromJson(Map<String, dynamic> json) =>
    _ApiErrorResponse(
      code: json['code'] as String,
      message: json['message'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ApiErrorResponseToJson(_ApiErrorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'timestamp': instance.timestamp.toIso8601String(),
    };
