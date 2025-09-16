import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/data/datasources/local/daily_quiz_local_store.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/data/models/submit_answer.models.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/data/repository_impl/quiz_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/domain/entities/quiz_entity.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/domain/usecases/submit_quiz_answer_usecase.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/presentation/provider/quiz_controller.dart';

/// 러닝 상태
class QuizRunState {
  final List<QuizEntity> quizzes;
  final int index; // 현재 문항 인덱스
  final bool submitting;
  final Map<int, String> answers; // userQuizId -> "true"/"false" or "1".."n"
  final SubmitAnswerResponse? lastResult; // 마지막 제출 결과(바텀시트 등에 사용)

  QuizRunState({
    required this.quizzes,
    required this.index,
    required this.submitting,
    required this.answers,
    this.lastResult,
  });

  QuizEntity get current => quizzes[index];
  bool get isLast => index >= quizzes.length - 1;

  QuizRunState copyWith({
    List<QuizEntity>? quizzes,
    int? index,
    bool? submitting,
    Map<int, String>? answers,
    SubmitAnswerResponse? lastResult,
    bool clearLastResult = false,
  }) {
    return QuizRunState(
      quizzes: quizzes ?? this.quizzes,
      index: index ?? this.index,
      submitting: submitting ?? this.submitting,
      answers: answers ?? this.answers,
      lastResult: clearLastResult ? null : (lastResult ?? this.lastResult),
    );
  }
}

class QuizRunController extends StateNotifier<QuizRunState> {
  QuizRunController(List<QuizEntity> quizzes, this._submitUseCase, this._local)
    : super(
        QuizRunState(
          quizzes: quizzes,
          index: 0,
          submitting: false,
          answers: <int, String>{},
        ),
      );

  final SubmitQuizAnswerUseCase _submitUseCase;
  final DailyQuizLocalStore _local;

  /// 선택 값 설정 (API 규격에 맞춰 저장: "true"/"false" 또는 "1".."n")
  void selectOx(bool value) {
    final q = state.current;
    final next = Map<int, String>.from(state.answers)
      ..[q.userQuizId] = value.toString(); // "true"/"false"
    state = state.copyWith(answers: next, clearLastResult: true);
  }

  void selectMcqByIndex1Based(int index1) {
    final q = state.current;
    // 가드: 범위 체크
    if (index1 < 1 || index1 > q.options.length) return;
    final next = Map<int, String>.from(state.answers)
      ..[q.userQuizId] = index1.toString(); // "1".."n"
    state = state.copyWith(answers: next, clearLastResult: true);
  }

  /// 보기 텍스트로 선택한 경우(옵션): 내부에서 1-based로 변환
  void selectMcqByText(String optionText) {
    final q = state.current;
    final i0 = q.options.indexOf(optionText);
    if (i0 == -1) return;
    selectMcqByIndex1Based(i0 + 1);
  }

  /// 현재 문제 제출 → 결과 반환
  Future<SubmitAnswerResponse> submitCurrent() async {
    final q = state.current;
    final selected = state.answers[q.userQuizId];
    if (selected == null) {
      throw StateError('선택한 답안이 없습니다.');
    }

    state = state.copyWith(submitting: true);

    try {
      final req = SubmitAnswerRequest(
        userQuizId: q.userQuizId,
        userAnswer: selected, // "true"/"false" or "1".."n"
      );
      final res = await _submitUseCase(req);

      // 일일 풀이 수 +1 (정/오답 무관)
      await _local.increaseSolvedCountToday(DateTime.now());

      state = state.copyWith(lastResult: res);
      return res;
    } finally {
      state = state.copyWith(submitting: false);
    }
  }

  /// 다음 문제로 이동 (마지막이면 true 반환)
  bool next() {
    if (state.isLast) return true;
    state = state.copyWith(index: state.index + 1, clearLastResult: true);
    return false;
  }

  /// 이전 문제로 이동(옵션)
  void prev() {
    if (state.index > 0) {
      state = state.copyWith(index: state.index - 1, clearLastResult: true);
    }
  }
}

final submitQuizAnswerUseCaseProvider = Provider<SubmitQuizAnswerUseCase>((
  ref,
) {
  final repo = ref.watch(quizRepositoryProvider); // 이미 정의된 Repo provider 사용
  return SubmitQuizAnswerUseCase(repo);
});

final quizRunControllerProvider = StateNotifierProvider.autoDispose
    .family<QuizRunController, QuizRunState, List<QuizEntity>>((ref, quizzes) {
      final submitUC = ref.watch(submitQuizAnswerUseCaseProvider);
      final local = ref.watch(dailyQuizLocalStoreProvider);
      return QuizRunController(quizzes, submitUC, local);
    });
