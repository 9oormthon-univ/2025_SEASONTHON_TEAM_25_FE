import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/auth/data/datasources/remote/auth_api.dart';
import 'package:seasonthon_team_25_fe/feature/auth/data/models/auth_models.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/login_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/sign_up_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/token_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/user_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/repositories/auth_repository.dart';
import 'package:seasonthon_team_25_fe/feature/data/local/nickname_storage_prefs.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _remote;
  final TokenStorage _tokenStorage;
  final NicknameStorage _nicknameStorage;

  AuthRepositoryImpl(this._remote, this._tokenStorage, this._nicknameStorage);

  @override
  Future<SignUpEntity> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _remote.signUp(
        SignUpRequest(email: email, password: password),
      );
      return SignUpEntity(
        id: res.id,
        email: res.email,
        role: res.role,
        status: res.status,
        characterCreated: res.characterCreated,
        createdAt: res.createdAt,
      );
    } catch (e) {
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
      );

      final tokens = AuthTokensEntity(
        accessToken: res.accessToken,
        refreshToken: res.refreshToken,
        tokenType: res.tokenType,
        expiresIn: res.expiresIn,
      );

      final user = UserEntity(
        userId: res.user.userId,
        email: res.user.email,
        role: res.user.role,
        status: res.user.status,
        characterCreated: res.user.characterCreated,
        characterName: res.user.characterName,
      );

      await _tokenStorage.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
        tokenType: tokens.tokenType,
        expiresIn: tokens.expiresIn,
      );

      // 유저의 닉네임이 로컬에 없고, 응답에 존재하면 저장
      final current = _nicknameStorage.getNickname();
      final incoming = user.characterName?.trim();
      if ((current == null || current.isEmpty) &&
          incoming != null &&
          incoming.isNotEmpty) {
        await _nicknameStorage.saveNickname(incoming);
      }
      return LoginEntity(tokens: tokens, user: user);
    } catch (e) {
      throw Exception(mapDioError(e));
    }
  }

  @override
  Future<AuthTokensEntity> refresh({required String refreshToken}) async {
    try {
      final res = await _remote.refresh(
        RefreshRequest(refreshToken: refreshToken),
      );
      final tokens = AuthTokensEntity(
        accessToken: res.accessToken,
        refreshToken: res.refreshToken,
        tokenType: res.tokenType,
        expiresIn: res.expiresIn,
      );
      await _tokenStorage.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
        tokenType: tokens.tokenType,
        expiresIn: tokens.expiresIn,
      );
      return tokens;
    } catch (e) {
      throw Exception(mapDioError(e));
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = ref.watch(authApiProvider);
  final tokenStore = ref.watch(tokenStorageProvider);
  final nicknameStorage = ref.watch(nicknameStorageProvider);
  return AuthRepositoryImpl(remote, tokenStore, nicknameStorage);
});
