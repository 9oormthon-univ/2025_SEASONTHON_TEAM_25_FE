import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ===== 모델 =====
class QuizItem {
  final int userQuizId;
  final int quizId;
  final String type; // 'OX' | 'MCQ'
  final String question;
  final bool? oxAnswer;
  final List<String>? mcqOptions;
  final int? mcqCorrectIndex;
  final dynamic userAnswer; // null | bool | int
  final String explanation;
  final bool? isCorrect;
  final String newsUrl;

  QuizItem({
    required this.userQuizId,
    required this.quizId,
    required this.type,
    required this.question,
    this.oxAnswer,
    this.mcqOptions,
    this.mcqCorrectIndex,
    this.userAnswer,
    required this.explanation,
    this.isCorrect,
    required this.newsUrl,
  });

  factory QuizItem.fromJson(Map<String, dynamic> json) {
    return QuizItem(
      userQuizId: json['userQuizId'] as int,
      quizId: json['quizId'] as int,
      type: json['type'] as String,
      question: json['question'] as String,
      oxAnswer: json['oxAnswer'] as bool?,
      mcqOptions: (json['mcqOptions'] as List?)?.map((e) => e.toString()).toList(),
      mcqCorrectIndex: json['mcqCorrectIndex'] as int?,
      userAnswer: json['userAnswer'], // 서버 값 그대로 보관
      explanation: json['explanation'] as String? ?? '',
      isCorrect: json['isCorrect'] as bool?,
      newsUrl: json['newsUrl'] as String? ?? '',
    );
  }
}

class DailyQuizResponse {
  final List<QuizItem> quizzes;
  final bool completed;

  DailyQuizResponse({required this.quizzes, required this.completed});

  factory DailyQuizResponse.fromJson(Map<String, dynamic> json) {
    final list = (json['quizzes'] as List<dynamic>)
        .map((e) => QuizItem.fromJson(e as Map<String, dynamic>))
        .toList();
    return DailyQuizResponse(
      quizzes: list,
      completed: json['completed'] as bool? ?? false,
    );
  }
}

/// ===== 레포 =====
final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return QuizRepository(dio);
});

class QuizRepository {
  final Dio _dio;
  QuizRepository(this._dio);

  Future<DailyQuizResponse> fetchDaily() async {
    final res = await _dio.get('/api/quiz/daily');
    return DailyQuizResponse.fromJson(res.data as Map<String, dynamic>);
  }
}

class QuizSessionState {
  final List<QuizItem> quizzes;
  final int currentIndex;
  final bool completed;
  final bool loading;
  final Object? error;

  const QuizSessionState({
    this.quizzes = const [],
    this.currentIndex = 0,
    this.completed = false,
    this.loading = false,
    this.error,
  });

  QuizSessionState copyWith({
    List<QuizItem>? quizzes,
    int? currentIndex,
    bool? completed,
    bool? loading,
    Object? error,
  }) {
    return QuizSessionState(
      quizzes: quizzes ?? this.quizzes,
      currentIndex: currentIndex ?? this.currentIndex,
      completed: completed ?? this.completed,
      loading: loading ?? this.loading,
      error: error,
    );
  }

  bool get hasData => quizzes.isNotEmpty;
  bool get isLast => currentIndex >= quizzes.length - 1;
}

final quizSessionProvider =
    StateNotifierProvider<QuizSessionNotifier, QuizSessionState>((ref) {
  final repo = ref.watch(quizRepositoryProvider);
  return QuizSessionNotifier(repo);
});

class QuizSessionNotifier extends StateNotifier<QuizSessionState> {
  QuizSessionNotifier(this._repo) : super(const QuizSessionState());
  final QuizRepository _repo;

  Future<void> loadDaily() async {
    try {
      state = state.copyWith(loading: true, error: null);
      final daily = await _repo.fetchDaily();
      state = QuizSessionState(
        quizzes: daily.quizzes,
        currentIndex: 0,
        completed: daily.completed,
        loading: false,
      );
    } catch (e) {
      state = state.copyWith(loading: false, error: e);
    }
  }

  void next() {
    if (state.isLast) {
      state = state.copyWith(completed: true);
    } else {
      state = state.copyWith(currentIndex: state.currentIndex + 1);
    }
  }

  // 로컬 선택 상태만 반영(서버 제출 API가 있으면 여기에 붙이면 됨)
  void answerOx(bool value) {
    // 필요 시 로컬 userAnswer 저장 로직 추가 가능
  }

  void answerMcq(int index) {
    // 필요 시 로컬 userAnswer 저장 로직 추가 가능
  }

  void restart() {
    if (state.hasData) {
      state = state.copyWith(currentIndex: 0, completed: false);
    }
  }
}