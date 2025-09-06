import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/storage/token_storage.dart';
import 'package:seasonthon_team_25_fe/feature/auth/data/repositoryImpl/auth_repositoyImpl.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/login_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/usecases/auth_usecase.dart';
import '../../domain/entities/sign_up_entity.dart';

final authUseCaseProvider = Provider<AuthUsecase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthUsecase(repo);
});

class AuthState {
  final AsyncValue<SignUpEntity?> signUp;
  final AsyncValue<LoginEntity?> login;
  const AuthState({
    this.signUp = const AsyncValue.data(null),
    this.login = const AsyncValue.data(null),
  });

  AuthState copyWith({
    AsyncValue<SignUpEntity?>? signUp,
    AsyncValue<LoginEntity?>? login,
  }) => AuthState(signUp: signUp ?? this.signUp, login: login ?? this.login);
}

class AuthController extends StateNotifier<AuthState> {
  final AuthUsecase _authUsecase;
  final TokenStorage _tokenStorage;

  AuthController(this._authUsecase, this._tokenStorage)
    : super(const AuthState());

  /// SecureStorage에 refreshToken이 있는지만 *빠르게* 확인
  Future<bool> hasRefreshToken() async {
    final rt = await _tokenStorage.readRefreshToken();
    return rt != null && rt.isNotEmpty;
  }

  /// refreshToken이 있다면 서버에 refresh를 시도하고,
  /// 성공하면 state.login을 채운 뒤 true 반환
  Future<bool> tryAutoLogin() async {
    try {
      final refresh = await _tokenStorage.readRefreshToken();
      if (refresh == null || refresh.isEmpty) return false;

      final result = await _authUsecase.refresh(refreshToken: refresh);
      // (리포지토리에서 saveTokens() 하고 있다면 여기서 추가 저장은 불필요)
      state = state.copyWith(login: AsyncValue.data(result));
      return true;
    } catch (e, st) {
      await _tokenStorage.clear();
      state = state.copyWith(login: AsyncValue.error(e, st));
      return false;
    }
  }

  Future<void> signOut() async {
    await _tokenStorage.clear();
    state = const AuthState();
  }

  Future<void> signUp(String email, String password) async {
    state = state.copyWith(signUp: const AsyncValue.loading());
    try {
      final result = await _authUsecase.signUp(
        email: email,
        password: password,
      );
      debugPrint('[AuthController] 회원 가입 성공: $result');
      state = state.copyWith(signUp: AsyncValue.data(result));
    } catch (e, st) {
      state = state.copyWith(signUp: AsyncValue.error(e, st));
    }
  }

  void clearSignUp() => state = const AuthState();

  Future<void> login(String email, String password) async {
    state = state.copyWith(login: const AsyncValue.loading());
    try {
      final result = await _authUsecase.login(email: email, password: password);
      debugPrint('[AuthController] 로그인 성공: $result');
      state = state.copyWith(login: AsyncValue.data(result));
    } catch (e, st) {
      state = state.copyWith(login: AsyncValue.error(e, st));
    }
  }

  void clearLogin() => state = const AuthState();
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final usecase = ref.watch(authUseCaseProvider);
    final storage = ref.watch(tokenStorageProvider);
    return AuthController(usecase, storage);
  },
);
