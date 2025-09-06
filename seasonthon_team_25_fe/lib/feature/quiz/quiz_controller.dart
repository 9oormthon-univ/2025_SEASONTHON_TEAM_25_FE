import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  final Map<int, String> answers; // userQuizId -> userAnswer(normalized)
  final Map<int, bool> verdicts; // userQuizId -> 정오
  final bool revealed; // 현재 문항 해설/정답 노출중?
  final bool retryMode; // 오답 재도전 라운드 여부
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
        retryMode: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(phase: QuizPhase.error, error: e.toString());
    }
  }

  /// 제출(타입 분기)
  /// - OX: [oxValue]만 전달
  /// - MCQ: [mcqIndex0]만 전달 (0-based)
  Future<void> submitCurrent({bool? oxValue, int? mcqIndex0}) async {
    final q = state.current;
    if (q == null) return;

    // 1) 로컬 정오판정용 normalized 문자열 생성
    late final String norm;
    if (q.type == QuizType.ox) {
      // 화면에서 받은 bool 그대로 toString()
      if (oxValue == null) return;
      norm = oxValue.toString(); // "true"/"false"
    } else {
      if (mcqIndex0 == null) return;
      final one = mcqIndex0 + 1;
      final max = q.mcqOptions?.length ?? 0;
      final safeOne = (max > 0) ? one.clamp(1, max) : one;
      norm = safeOne.toString(); // "1".."n"
    }

    // 2) 로컬 정오판정
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

    // 3) 서버 제출: **OX=bool, MCQ=int(1-based)**
    try {
      dynamic userAnswer;
      if (q.type == QuizType.ox) {
        userAnswer = oxValue; // bool
      } else {
        final one = (mcqIndex0! + 1);
        final max = q.mcqOptions?.length ?? 0;
        userAnswer = (max > 0) ? one.clamp(1, max) : one; // int
      }

      if (kDebugMode) {
        log('[QUIZ] submit payload => {userQuizId: ${q.userQuizId}, '
            'type: ${q.type}, userAnswer: $userAnswer (${userAnswer.runtimeType})}');
      }

      await _api.submitAnswer(userQuizId: q.userQuizId, userAnswer: userAnswer);
    } catch (e) {
      log('[QUIZ] submit failed: $e');
      state = state.copyWith(error: '제출 실패: $e');
    }
  }

  /// 오답이면 같은 문항을 다시 풀기 위해 호출
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
      final wrongIds = state.verdicts.entries
          .where((e) => e.value == false)
          .map((e) => e.key)
          .toSet();

      if (!state.retryMode && wrongIds.isNotEmpty) {
        final wrongQuestions = state.questions
            .where((qq) => wrongIds.contains(qq.userQuizId))
            .toList();

        state = state.copyWith(
          phase: QuizPhase.ready, // 시작 화면으로 돌려보내고 버튼 누르면 재시작
          questions: wrongQuestions,
          index: 0,
          revealed: false,
          retryMode: true,
          answers: {}, // 다시 풀게 하므로 리셋
          verdicts: {},
          error: null,
        );
      } else {
        state = state.copyWith(phase: QuizPhase.finished, revealed: false);
      }
    } else {
      state = state.copyWith(
        index: state.index + 1,
        phase: QuizPhase.asking,
        revealed: false,
        error: null,
      );
    }
  }
}

// ===== Provider =====
final quizControllerProvider =
    StateNotifierProvider<QuizController, QuizRunState>((ref) {
  final api = ref.watch(quizApiProvider);
  return QuizController(api);
});