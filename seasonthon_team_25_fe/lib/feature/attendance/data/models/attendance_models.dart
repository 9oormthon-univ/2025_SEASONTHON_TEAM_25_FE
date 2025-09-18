import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_models.freezed.dart';
part 'attendance_models.g.dart';

@freezed
abstract class AttendanceCheckResponse with _$AttendanceCheckResponse {
  const factory AttendanceCheckResponse({
    required bool success,
    required String message,
    String? achievementType,
    required bool achievementCreated,
  }) = _AttendanceCheckResponse;

  factory AttendanceCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$AttendanceCheckResponseFromJson(json);
}
