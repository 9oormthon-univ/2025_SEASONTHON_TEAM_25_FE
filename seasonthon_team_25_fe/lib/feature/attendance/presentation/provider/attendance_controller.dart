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
  final String? errorMessage;

  const AttendanceState({
    this.isLoading = false,
    this.lastCheckResult,
    this.errorMessage,
  });

  AttendanceState copyWith({
    bool? isLoading,
    AttendanceCheckEntity? lastCheckResult,
    String? errorMessage,
  }) {
    return AttendanceState(
      isLoading: isLoading ?? this.isLoading,
      lastCheckResult: lastCheckResult ?? this.lastCheckResult,
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

  void clearLastResult() {
    state = state.copyWith(lastCheckResult: null);
  }
}
