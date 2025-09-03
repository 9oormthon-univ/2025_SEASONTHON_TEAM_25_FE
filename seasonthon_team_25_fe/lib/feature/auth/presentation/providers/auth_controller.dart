import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/auth/data/repositoryImpl/auth_remote_datasource.dart';
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
  AuthController(this._authUsecase) : super(const AuthState());

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
      // 여기서 이미 mapDioError로 변환되어 들어오므로 e.toString()이 사용자친화적
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
      // 여기서 이미 mapDioError로 변환되어 들어오므로 e.toString()이 사용자친화적
      state = state.copyWith(login: AsyncValue.error(e, st));
    }
  }

  void clearLogin() => state = const AuthState();
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final usecase = ref.watch(authUseCaseProvider);
    return AuthController(usecase);
  },
);
