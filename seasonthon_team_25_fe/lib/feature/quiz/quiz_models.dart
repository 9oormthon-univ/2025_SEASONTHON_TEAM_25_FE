import 'package:flutter/foundation.dart';

enum QuizType { ox, mcq }

// ----- 타입 추론: 서버가 type을 잘못 보내도 데이터 모양으로 보정 -----
QuizType _inferType(Map<String, dynamic> json) {
  final raw = json['type']?.toString().toUpperCase();
  if (raw == 'OX') return QuizType.ox;
  if (raw == 'MCQ') return QuizType.mcq;

  final options = json['mcqOptions'];
  if (options is List && options.length >= 2) return QuizType.mcq;

  final ox = json['oxAnswer'];
  if (ox is bool || ox is num || ox is String) return QuizType.ox;

  return QuizType.mcq; // 기본값
}

// ----- 유틸 파서들 -----
int _asInt(dynamic v, {int fallback = 0}) {
  if (v is int) return v;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v) ?? fallback;
  return fallback;
}

int? _asIntOrNull(dynamic v) {
  if (v is int) return v;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v);
  return null;
}

bool? _asBool(dynamic v) {
  if (v == null) return null;
  if (v is bool) return v;
  if (v is num) return v != 0;
  if (v is String) {
    final s = v.trim().toLowerCase();
    if (s == 'true' || s == 't' || s == 'o' || s == '1') return true;
    if (s == 'false' || s == 'f' || s == 'x' || s == '0') return false;
  }
  return null;
}

List<String>? _asStringList(dynamic v) {
  if (v is List) return v.map((e) => e.toString()).toList();
  return null;
}

// ----- 모델 -----

@immutable
class QuizQuestion {
  final int userQuizId;
  final int quizId;
  final QuizType type;
  final String question;

  // 정답(타입별)
  final bool? oxAnswer;           // OX일 때만
  final List<String>? mcqOptions; // MCQ일 때만
  final int? mcqCorrectIndex;     // 1-based, MCQ일 때만

  // 유저 답(서버가 내려줄 수 있음; 타입별 보관)
  final bool? oxUserAnswer;       // OX일 때만
  final int? mcqUserIndex;        // 1-based, MCQ일 때만

  final String? explanation;
  final String? newsUrl;

  const QuizQuestion({
    required this.userQuizId,
    required this.quizId,
    required this.type,
    required this.question,
    this.oxAnswer,
    this.mcqOptions,
    this.mcqCorrectIndex,
    this.oxUserAnswer,
    this.mcqUserIndex,
    this.explanation,
    this.newsUrl,
  });

  /// 서버 → 도메인 (타입 교정 + 불일치 필드 무시)
  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    final type = _inferType(json);

    final userQuizId = _asInt(json['userQuizId']);
    final quizId = _asInt(json['quizId']);
    final question = json['question']?.toString() ?? '';

    bool? oxAns;
    bool? oxUser;
    List<String>? mcqOpts;
    int? mcqCorrect;
    int? mcqUser;

    if (type == QuizType.ox) {
      oxAns = _asBool(json['oxAnswer']);
      oxUser = _asBool(json['userAnswer']);
    } else {
      mcqOpts = _asStringList(json['mcqOptions']);
      mcqCorrect = _asIntOrNull(json['mcqCorrectIndex']);
      mcqUser = _asIntOrNull(json['userAnswer']);

      // 1-based 범위 보정
      final max = mcqOpts?.length ?? 0;
      if (mcqCorrect != null && max > 0) {
        mcqCorrect = mcqCorrect!.clamp(1, max);
      }
      if (mcqUser != null && max > 0) {
        mcqUser = mcqUser!.clamp(1, max);
      }
    }

    return QuizQuestion(
      userQuizId: userQuizId,
      quizId: quizId,
      type: type,
      question: question,
      oxAnswer: oxAns,
      mcqOptions: mcqOpts,
      mcqCorrectIndex: mcqCorrect,
      oxUserAnswer: oxUser,
      mcqUserIndex: mcqUser,
      explanation: json['explanation']?.toString(),
      newsUrl: json['newsUrl']?.toString(),
    );
  }

  /// 정답 표준 문자열 (로컬 판정용)
  /// OX: "true"/"false", MCQ: "1".."n"
  String get normalizedCorrect {
    if (type == QuizType.ox) {
      return (oxAnswer ?? false).toString();
    } else {
      final idx = mcqCorrectIndex ?? 1;
      final max = (mcqOptions?.length ?? 0);
      final safe = (max > 0) ? idx.clamp(1, max) : idx;
      return safe.toString();
    }
  }

  /// 유저답 표준 문자열(없으면 빈 문자열)
  String get normalizedUser {
    if (type == QuizType.ox) {
      final b = oxUserAnswer;
      return b == null ? '' : b.toString();
    } else {
      final idx = mcqUserIndex;
      return idx == null ? '' : idx.toString();
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
      isCompleted: (json['isCompleted'] as bool?) ??
          (json['completed'] as bool? ?? false),
      quizzes: list
          .map((e) => e is Map ? Map<String, dynamic>.from(e) : <String, dynamic>{})
          .map(QuizQuestion.fromJson)
          .toList(),
    );
  }
}