import 'package:seasonthon_team_25_fe/feature/attendance/domain/entities/attendance_entity.dart';

abstract class AttendanceRepository {
  Future<AttendanceCheckEntity> checkAttendance();
  Future<AttendanceCalendarEntity> getAttendanceCalendar({
    required int year,
    required int month,
  });
}
