import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/attendance/data/repository_impl/attendance_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:seasonthon_team_25_fe/feature/attendance/domain/repository/attendance_repository.dart';

final attendanceControllerProvider = StateNotifierProvider<AttendanceController, AttendanceState>((ref) {
  final repository = ref.watch(attendanceRepositoryProvider);
  return AttendanceController(repository);
});

class AttendanceState {
  final bool isLoading;
  final AttendanceCheckEntity? lastCheckResult;
  final AttendanceCalendarEntity? calendarData;
  final String? errorMessage;

  const AttendanceState({
    this.isLoading = false,
    this.lastCheckResult,
    this.calendarData,
    this.errorMessage,
  });

  AttendanceState copyWith({
    bool? isLoading,
    AttendanceCheckEntity? lastCheckResult,
    AttendanceCalendarEntity? calendarData,
    String? errorMessage,
  }) {
    return AttendanceState(
      isLoading: isLoading ?? this.isLoading,
      lastCheckResult: lastCheckResult ?? this.lastCheckResult,
      calendarData: calendarData ?? this.calendarData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AttendanceController extends StateNotifier<AttendanceState> {
  final AttendanceRepository _repository;

  AttendanceController(this._repository) : super(const AttendanceState());

  Future<void> checkAttendance() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    try {
      final result = await _repository.checkAttendance();
      state = state.copyWith(
        isLoading: false,
        lastCheckResult: result,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> loadCalendar({required int year, required int month}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    
    try {
      final calendar = await _repository.getAttendanceCalendar(year: year, month: month);
      state = state.copyWith(
        isLoading: false,
        calendarData: calendar,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  void clearLastResult() {
    state = state.copyWith(lastCheckResult: null);
  }
}
