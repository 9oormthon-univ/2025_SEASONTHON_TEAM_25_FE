// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceCheckResponse _$AttendanceCheckResponseFromJson(
  Map<String, dynamic> json,
) => _AttendanceCheckResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  achievementType: json['achievementType'] as String?,
  achievementCreated: json['achievementCreated'] as bool,
);

Map<String, dynamic> _$AttendanceCheckResponseToJson(
  _AttendanceCheckResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'achievementType': instance.achievementType,
  'achievementCreated': instance.achievementCreated,
};
