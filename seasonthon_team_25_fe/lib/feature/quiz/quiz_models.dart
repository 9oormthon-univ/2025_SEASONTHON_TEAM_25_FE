// lib/feature/quiz/domain/models.dart
import 'package:flutter/foundation.dart';

enum QuizType { ox, mcq }

QuizType _parseType(String s) {
  switch (s.toUpperCase()) {
    case 'OX':
      return QuizType.ox;
    case 'MCQ':
      return QuizType.mcq;
    default:
      return QuizType.mcq;
  }
}

@immutable
class QuizQuestion {
  final int userQuizId;
  final int quizId;
  final QuizType type;
  final String question;
  final bool? oxAnswer;           // OX 정답 (OX일 때만 채움)
  final List<String>? mcqOptions; // MCQ 보기 (MCQ일 때만 채움)
  final int? mcqCorrectIndex;     // 1-based 정답 인덱스 (MCQ일 때만)
  final String? explanation;      // 해설
  final String? newsUrl;

  const QuizQuestion({
    required this.userQuizId,
    required this.quizId,
    required this.type,
    required this.question,
    this.oxAnswer,
    this.mcqOptions,
    this.mcqCorrectIndex,
    this.explanation,
    this.newsUrl,
  });

  /// 서버 응답의 한 아이템 DTO → 도메인 변환
  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    final type = _parseType(json['type']?.toString() ?? 'MCQ');
    return QuizQuestion(
      userQuizId: (json['userQuizId'] as num).toInt(),
      quizId: (json['quizId'] as num).toInt(),
      type: type,
      question: json['question']?.toString() ?? '',
      oxAnswer: json['oxAnswer'] as bool?,
      mcqOptions: (json['mcqOptions'] as List?)?.map((e) => e.toString()).toList(),
      mcqCorrectIndex: (json['mcqCorrectIndex'] as num?)?.toInt(), // 1-based!
      explanation: json['explanation']?.toString(),
      newsUrl: json['newsUrl']?.toString(),
    );
  }

  /// 로컬 정오판정에 쓰기 좋게 "정답표준문자열"로 변환
  /// - OX: "true"/"false"
  /// - MCQ: "1".."4" (1-based)
  String get normalizedCorrect {
    if (type == QuizType.ox) {
      return (oxAnswer ?? false).toString(); // "true"/"false"
    } else {
      final idx = mcqCorrectIndex ?? 1;
      return idx.toString(); // "1".."4"
    }
  }
}

@immutable
class DailyQuizResponse {
  final bool isCompleted;
  final List<QuizQuestion> quizzes;

  const DailyQuizResponse({
    required this.isCompleted,
    required this.quizzes,
  });

  factory DailyQuizResponse.fromJson(Map<String, dynamic> json) {
    final list = (json['quizzes'] as List? ?? const []);
    return DailyQuizResponse(
      isCompleted: (json['isCompleted'] as bool?) ?? (json['completed'] as bool? ?? false),
      quizzes: list
          .whereType<Map>()
          .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
          .map(QuizQuestion.fromJson)
          .toList(),
    );
  }
}