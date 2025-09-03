import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/auth/data/datasources/remote/auth_api.dart';
import 'package:seasonthon_team_25_fe/feature/auth/data/models/auth_models.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/login_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _remote;
  AuthRepositoryImpl(this._remote);

  @override
  Future<SignUpEntity> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _remote.signUp(
        SignUpRequest(email: email, password: password),
      ); // 2xx면 들어옴
      return SignUpEntity(
        id: res.id,
        email: res.email,
        role: res.role,
        status: res.status,
        characterCreated: res.characterCreated,
        createdAt: res.createdAt,
      );
    } catch (e) {
      // 4xx/5xx → DioException → 사람이 읽을 메시지로 변환 후 throw
      throw Exception(mapDioError(e));
    }
  }

  @override
  Future<LoginEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _remote.login(
        LoginRequest(email: email, password: password),
      ); // 2xx면 들어옴

      return LoginEntity(
        accessToken: res.accessToken,
        refreshToken: res.refreshToken,
        tokenType: res.tokenType,
        expiresIn: res.expiresIn,
        userId: res.user.userId,
        email: res.user.email,
        role: res.user.role,
        status: res.user.status,
        characterCreated: res.user.characterCreated,
      );
    } catch (e) {
      // 4xx/5xx → DioException → 사람이 읽을 메시지로 변환 후 throw
      throw Exception(mapDioError(e));
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = ref.watch(authApiProvider);
  return AuthRepositoryImpl(remote);
});
