class AttendanceCheckEntity {
  final bool success;
  final String message;
  final String? achievementType;
  final bool achievementCreated;

  const AttendanceCheckEntity({
    required this.success,
    required this.message,
    this.achievementType,
    required this.achievementCreated,
  });
}

class AttendanceCalendarEntity {
  final int year;
  final int month;
  final int totalDays;
  final List<bool> attendanceMap;
  final int attendanceCount;
  final int startDayOfWeek;

  const AttendanceCalendarEntity({
    required this.year,
    required this.month,
    required this.totalDays,
    required this.attendanceMap,
    required this.attendanceCount,
    required this.startDayOfWeek,
  });
}
