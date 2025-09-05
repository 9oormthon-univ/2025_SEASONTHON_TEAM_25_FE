import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/core/storage/token_storage.dart';
import 'package:seasonthon_team_25_fe/feature/auth/data/datasources/remote/auth_api.dart';
import 'package:seasonthon_team_25_fe/feature/auth/data/models/auth_models.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/login_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _remote;
  final TokenStorage _tokenStorage;

  AuthRepositoryImpl(this._remote, this._tokenStorage);

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

      // 로그인 성공 시 토큰 저장 (SecureStorage)
      await _tokenStorage.saveTokens(
        accessToken: res.accessToken,
        refreshToken: res.refreshToken,
        tokenType: res.tokenType,
        expiresIn: res.expiresIn,
      );

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

  @override
  Future<LoginEntity> refresh({required String refreshToken}) async {
    try {
      final res = await _remote.refresh(
        RefreshRequest(refreshToken: refreshToken),
      );

      // 재발급 성공 시 새 토큰 저장
      await _tokenStorage.saveTokens(
        accessToken: res.accessToken,
        refreshToken: res.refreshToken,
        tokenType: res.tokenType,
        expiresIn: res.expiresIn,
      );

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
      throw Exception(mapDioError(e));
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = ref.watch(authApiProvider);
  final tokenStore = ref.watch(tokenStorageProvider);
  return AuthRepositoryImpl(remote, tokenStore);
});
