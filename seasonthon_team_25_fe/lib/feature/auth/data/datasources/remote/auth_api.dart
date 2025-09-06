import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/auth/data/models/auth_models.dart';
part 'auth_api.g.dart';

// retrofit interface
@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/api/auth/sign-up')
  Future<SignUpResponse> signUp(@Body() SignUpRequest body);

  @POST('/api/auth/login')
  Future<LoginResponse> login(@Body() LoginRequest body);

  @POST('/api/auth/refresh')
  Future<LoginResponse> refresh(@Body() RefreshRequest body);
}

final authApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthApi(dio);
});
