// lib/feature/quiz/application/quiz_controller.dart
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/quiz_api.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/quiz_models.dart';

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
  final bool retryMode; // ✅ 오답 재도전 라운드 여부
  final String? error;

  const QuizRunState({
    required this.phase,
    required this.isCompleted,
    required this.questions,
    required this.index,
    required this.answers,
    required this.verdicts,
    required this.revealed,
    required this.retryMode,
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
        retryMode: false,
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
    bool? retryMode,
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
      retryMode: retryMode ?? this.retryMode,
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
      state = state.copyWith(phase: QuizPhase.loading, error: null, retryMode: false);
      final res = await _api.fetchDaily();

      if (res.isCompleted) {
        state = state.copyWith(
          phase: QuizPhase.finished,
          isCompleted: true,
          questions: const [],
          index: 0,
          retryMode: false,
        );
        return;
      }

      if (res.quizzes.isEmpty) {
        state = state.copyWith(
          phase: QuizPhase.ready,
          isCompleted: false,
          questions: const [],
          index: 0,
          retryMode: false,
        );
        return;
      }

      if (kDebugMode) {
        for (final q in res.quizzes) {
          debugPrint('[QUIZ] preload correct userQuizId=${q.userQuizId} '
              'correct=${q.normalizedCorrect} type=${q.type}');
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
        retryMode: false, // ✅ 첫 라운드는 false
        error: null,
      );
    } catch (e) {
      state = state.copyWith(phase: QuizPhase.error, error: e.toString());
    }
  }

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
      state = state.copyWith(error: '제출 실패: $e');
    }
  }

  /// ✅ 오답이면 같은 문항을 다시 풀기 위해 호출
  void retryCurrent() {
    final q = state.current;
    if (q == null) return;
    final newAnswers = Map<int, String>.from(state.answers)..remove(q.userQuizId);
    final newVerdicts = Map<int, bool>.from(state.verdicts)..remove(q.userQuizId);

    state = state.copyWith(
      answers: newAnswers,
      verdicts: newVerdicts,
      revealed: false,
      phase: QuizPhase.asking,
      error: null,
    );
  }

  /// 다음 문제로 이동 (라운드 종료 시 오답만 재시작 or 완주)
  void next() {
    if (state.isLast) {
      // 마지막 문항 처리
      // 오답 모으기
      final wrongIds = state.verdicts.entries
          .where((e) => e.value == false)
          .map((e) => e.key)
          .toSet();

      // 아직 재도전 라운드가 아니고, 오답이 있다면 → 오답 라운드로 '준비' 상태 전환
      if (!state.retryMode && wrongIds.isNotEmpty) {
        final wrongQuestions = state.questions
            .where((qq) => wrongIds.contains(qq.userQuizId))
            .toList();

        state = state.copyWith(
          phase: QuizPhase.ready, // 시작 화면으로 돌려보내고 버튼 누르면 재시작
          questions: wrongQuestions,
          index: 0,
          revealed: false,
          retryMode: true,        // ✅ 재도전 라운드
          // 기존 기록 중 오답들만 남겨도 되고, 깔끔하게 비워도 됨
          answers: {},            // 다시 풀게 하므로 리셋
          verdicts: {},
          error: null,
        );
      } else {
        // 재도전 라운드까지 완료 → 끝
        state = state.copyWith(phase: QuizPhase.finished, revealed: false);
      }
    } else {
      // 다음 문항으로
      state = state.copyWith(
        index: state.index + 1,
        phase: QuizPhase.asking,
        revealed: false,
        error: null,
      );
    }
  }
}

// ===== Helpers & Providers =====
String _normalizeAnswer(String v) {
  final s = v.trim().toLowerCase();
  if (s == 'o' || s == 'true' || s == '1') return 'true';
  if (s == 'x' || s == 'false' || s == '0') return 'false';
  return s; // MCQ "1".."4"
}

// 주입부는 기존과 동일 (dioProvider는 프로젝트 전역 것을 사용)
final quizApiProvider = Provider<QuizApi>((ref) {
  final dio = ref.watch(dioProvider);
  return QuizApi(dio);
});

final quizControllerProvider =
    StateNotifierProvider<QuizController, QuizRunState>((ref) {
  final api = ref.watch(quizApiProvider);
  return QuizController(api);
});