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
