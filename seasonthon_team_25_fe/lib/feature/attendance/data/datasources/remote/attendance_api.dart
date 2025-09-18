import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seasonthon_team_25_fe/feature/attendance/data/models/attendance_models.dart';

part 'attendance_api.g.dart';

@RestApi()
abstract class AttendanceApi {
  factory AttendanceApi(Dio dio, {String baseUrl}) = _AttendanceApi;

  @POST('/api/attendances')
  Future<AttendanceCheckResponse> checkAttendance();

  @GET('/api/attendances/calendar')
  Future<AttendanceCalendarResponse> getAttendanceCalendar({
    @Query('year') required int year,
    @Query('month') required int month,
  });
}
