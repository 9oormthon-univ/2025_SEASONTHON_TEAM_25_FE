import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/attendance/data/datasources/remote/attendance_api.dart';
import 'package:seasonthon_team_25_fe/feature/attendance/data/models/attendance_models.dart';
import 'package:seasonthon_team_25_fe/feature/attendance/domain/entities/attendance_entity.dart';
import 'package:seasonthon_team_25_fe/feature/attendance/domain/repository/attendance_repository.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceApi _api;

  AttendanceRepositoryImpl(this._api);

  @override
  Future<AttendanceCheckEntity> checkAttendance() async {
    final response = await _api.checkAttendance();
    return _mapCheckResponseToEntity(response);
  }

  AttendanceCheckEntity _mapCheckResponseToEntity(AttendanceCheckResponse response) {
    return AttendanceCheckEntity(
      success: response.success,
      message: response.message,
      achievementType: response.achievementType,
      achievementCreated: response.achievementCreated,
    );
  }
}

final attendanceApiProvider = Provider<AttendanceApi>((ref) {
  final dio = ref.watch(dioProvider);
  return AttendanceApi(dio);
});

final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  final api = ref.watch(attendanceApiProvider);
  return AttendanceRepositoryImpl(api);
});
