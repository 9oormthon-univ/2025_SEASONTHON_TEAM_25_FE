import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/presentation/provider/daily_quiz_state.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/domain/usecases/get_daily_quizzes_usecase.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/data/datasources/local/daily_quiz_local_store.dart';

class DailyQuizController extends StateNotifier<DailyQuizState> {
  DailyQuizController(this._getDailyQuizzes, this._local)
      : super(const DailyQuizState.loading());

  final GetDailyQuizzesUseCase _getDailyQuizzes;
  final DailyQuizLocalStore _local;

  Future<void> load() async {
    state = const DailyQuizState.loading();
    try {
      final res = await _getDailyQuizzes();
      final now = DateTime.now();

      // 남은 문제 수(서버 스펙에 맞춰 적절히 계산/바인딩)
      final remaining = res.quizzes.length;

      // 1) 완료: 남은 문제가 없을 때
      if (remaining == 0 || res.completed == true) {
        await _local.resetTodayFlags(now);
        state = DailyQuizState.completed(data: res);
        return;
      }

      // 2) 첫 방문: 오늘 퀴즈 페이지 첫 진입
      final isFirst = await _local.isFirstVisitToday(now);
      if (isFirst) {
        await _local.markTodayVisited(now);
        state = DailyQuizState.firstVisitToday(
          data: res,
          remainingCount: remaining,
        );
        return;
      }

      // 3/4) 진행/오답 단계는 '오늘 푼 개수'로 판단
      final solvedCount = await _local.getSolvedCountToday(now);

      // hasWrong: 5문제를 모두 풀었는데 아직 문제가 남아있을 때
      if (solvedCount >= 5 && remaining > 0) {
        state = DailyQuizState.hasWrong(
          data: res,
          remainingCount: remaining,
        );
        return;
      }

      // resumeInProgress: 5문제를 푼 기록이 없을 때 (남아있음은 위에서 보장)
      state = DailyQuizState.resumeInProgress(
        data: res,
        remainingCount: remaining,
      );
    } catch (e) {
      state = DailyQuizState.error(e.toString());
    }
  }

  // (선택) 문제를 풀 때마다 호출해서 오늘 푼 개수 +1
  Future<void> onSolvedOne() async {
    await _local.increaseSolvedCountToday(DateTime.now());
  }

  // (선택) 디버그/관리용: 오늘 푼 개수를 직접 세팅
  Future<void> setSolvedCount(int count) async {
    await _local.setSolvedCountToday(count, DateTime.now());
  }
}

final dailyQuizLocalStoreProvider = Provider<DailyQuizLocalStore>((ref) {
  return DailyQuizLocalStore(); // 필요 시 keyPrefix 등 적용
});

final dailyQuizControllerProvider =
    StateNotifierProvider<DailyQuizController, DailyQuizState>((ref) {
  return DailyQuizController(
    ref.watch(getDailyQuizzesUseCaseProvider),
    ref.watch(dailyQuizLocalStoreProvider),
  );
});
