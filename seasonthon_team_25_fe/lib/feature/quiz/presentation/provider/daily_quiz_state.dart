import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/domain/entities/quiz_entity.dart';

part 'daily_quiz_state.freezed.dart';

@freezed
sealed class DailyQuizState with _$DailyQuizState {
  const factory DailyQuizState.loading() = _Loading;
  const factory DailyQuizState.error(String message) = _Error;

  const factory DailyQuizState.firstVisitToday({
    required DailyQuizEntity data,
    required int remainingCount,
  }) = _FirstVisitToday;

  const factory DailyQuizState.resumeInProgress({
    required DailyQuizEntity data,
    required int remainingCount,
  }) = _ResumeInProgress;

  const factory DailyQuizState.hasWrong({
    required DailyQuizEntity data,
    required int remainingCount,
  }) = _HasWrong;

  const factory DailyQuizState.completed({required DailyQuizEntity data}) =
      _Completed;
}
