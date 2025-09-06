// lib/feature/quiz/application/quiz_controller.dart
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/quiz_api.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/quiz_models.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/repository/quiz.dart';

// ===== Phase =====
enum QuizPhase { loading, ready, asking, revealed, finished, error }

// ===== State =====
class QuizRunState {
  final QuizPhase phase;
  final bool isCompleted; // 서버 플래그(오늘 이미 끝)
  final List<QuizQuestion> questions;
  final int index; // 현재 문항 인덱스 (0-based)
  final Map<int, String> answers; // userQuizId -> userAnswer
  final Map<int, bool> verdicts; // userQuizId -> 정오
  final bool revealed; // 현재 문항 해설/정답 노출중?
  final String? error;

  const QuizRunState({
    required this.phase,
    required this.isCompleted,
    required this.questions,
    required this.index,
    required this.answers,
    required this.verdicts,
    required this.revealed,
    this.error,
  });

  factory QuizRunState.initial() => const QuizRunState(
        phase: QuizPhase.loading,
        isCompleted: false,
        questions: [],
        index: 0,
        answers: {},
        verdicts: {},
        revealed: false,
        error: null,
      );

  bool get hasData => questions.isNotEmpty;
  bool get isLast => index >= questions.length - 1;
  QuizQuestion? get current => hasData ? questions[index] : null;

  QuizRunState copyWith({
    QuizPhase? phase,
    bool? isCompleted,
    List<QuizQuestion>? questions,
    int? index,
    Map<int, String>? answers,
    Map<int, bool>? verdicts,
    bool? revealed,
    String? error,
  }) {
    return QuizRunState(
      phase: phase ?? this.phase,
      isCompleted: isCompleted ?? this.isCompleted,
      questions: questions ?? this.questions,
      index: index ?? this.index,
      answers: answers ?? this.answers,
      verdicts: verdicts ?? this.verdicts,
      revealed: revealed ?? this.revealed,
      error: error,
    );
  }
}

// ===== Notifier =====
class QuizController extends StateNotifier<QuizRunState> {
  final QuizApi _api;
  QuizController(this._api) : super(QuizRunState.initial());

  Future<void> loadDaily() async {
    try {
      state = state.copyWith(phase: QuizPhase.loading, error: null);
      final res = await _api.fetchDaily();

      if (res.isCompleted) {
        state = state.copyWith(
          phase: QuizPhase.finished,
          isCompleted: true,
          questions: const [],
          index: 0,
        );
        return;
      }

      if (res.quizzes.isEmpty) {
        state = state.copyWith(
          phase: QuizPhase.ready,
          isCompleted: false,
          questions: const [],
          index: 0,
        );
        return;
      }

      // 첫 문제 진입
      if (kDebugMode) {
        for (final q in res.quizzes) {
          debugPrint('[QUIZ] preload correct userQuizId=${q.userQuizId} '
              'correct=${q.normalizedCorrect} type=${
              q.type == QuizType.ox ? 'OX' : 'MCQ'}');
        }
      }

      state = state.copyWith(
        phase: QuizPhase.asking,
        isCompleted: false,
        questions: res.quizzes,
        index: 0,
        answers: {},
        verdicts: {},
        revealed: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(phase: QuizPhase.error, error: e.toString());
    }
  }

  /// 선택 → 즉시 판정 + 제출 → revealed
  Future<void> submitCurrent(String userAnswer) async {
    final q = state.current;
    if (q == null) return;

    final norm = _normalizeAnswer(userAnswer);
    final isCorrect = (norm == q.normalizedCorrect);

    final newAnswers = Map<int, String>.from(state.answers)..[q.userQuizId] = norm;
    final newVerdicts = Map<int, bool>.from(state.verdicts)..[q.userQuizId] = isCorrect;

    state = state.copyWith(
      answers: newAnswers,
      verdicts: newVerdicts,
      revealed: true,
      phase: QuizPhase.revealed,
      error: null,
    );

    try {
      await _api.submitAnswer(userQuizId: q.userQuizId, userAnswer: norm);
    } catch (e) {
      log('[QUIZ] submit failed: $e');
      state = state.copyWith(error: '제출 실패: $e'); // UI에서 토스트/스낵바 처리
    }
  }

  /// 다음 문제로 이동
  void next() {
    if (state.isLast) {
      state = state.copyWith(phase: QuizPhase.finished, revealed: false);
    } else {
      state = state.copyWith(
        index: state.index + 1,
        phase: QuizPhase.asking,
        revealed: false,
        error: null,
      );
    }
  }

  /// (선택) 이전 문제로 보기만 이동 (재제출은 안함)
  void prev() {
    if (state.index == 0) return;
    state = state.copyWith(
      index: state.index - 1,
      phase: QuizPhase.revealed, // 이전 문제는 이미 답했을 가능성 높음
      revealed: true,
    );
  }
}

// ===== Helpers & Providers =====

String _normalizeAnswer(String v) {
  final s = v.trim().toLowerCase();
  if (s == 'o' || s == 'true' || s == '1') return 'true';
  if (s == 'x' || s == 'false' || s == '0') return 'false';
  return s; // MCQ "1".."4"
}

// 외부에서 주입하는 Dio → QuizApi
final quizApiProvider = Provider<QuizApi>((ref) {
  final dio = ref.watch(dioProvider); // 프로젝트의 전역 dioProvider
  return QuizApi(dio);
});

final quizControllerProvider =
    StateNotifierProvider<QuizController, QuizRunState>((ref) {
  final api = ref.watch(quizApiProvider);
  return QuizController(api);
});