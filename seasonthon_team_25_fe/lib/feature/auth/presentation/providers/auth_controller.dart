import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/auth/data/repositoryImpl/auth_repositoy_impl.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/login_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/usecases/auth_usecase.dart';
import '../../domain/entities/sign_up_entity.dart';

final authUseCaseProvider = Provider<AuthUsecase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthUsecase(repo);
});

class AuthState {
  final AsyncValue<SignUpEntity?> signUp;
  final AsyncValue<LoginEntity?>  login;

  const AuthState({
    this.signUp = const AsyncValue.data(null),
    this.login  = const AsyncValue.data(null),
  });

  AuthState copyWith({
    AsyncValue<SignUpEntity?>? signUp,
    AsyncValue<LoginEntity?>?  login,
  }) => AuthState(
        signUp: signUp ?? this.signUp,
        login:  login  ?? this.login,
      );
}

class AuthController extends StateNotifier<AuthState> {
  final AuthUsecase _authUsecase;

  AuthController(this._authUsecase) : super(const AuthState());

  Future<void> signUp(String email, String password) async {
    state = state.copyWith(signUp: const AsyncValue.loading());
    try {
      final result = await _authUsecase.signUp(email: email, password: password);
      state = state.copyWith(signUp: AsyncValue.data(result));
    } catch (e, st) {
      state = state.copyWith(signUp: AsyncValue.error(e, st));
    }
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(login: const AsyncValue.loading());
    try {
      final result = await _authUsecase.login(email: email, password: password);
      state = state.copyWith(login: AsyncValue.data(result));
      // 🔒 토큰 저장/갱신은 Repository + Dio 인터셉터에서 처리됨
    } catch (e, st) {
      state = state.copyWith(login: AsyncValue.error(e, st));
    }
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  final usecase = ref.watch(authUseCaseProvider);
  return AuthController(usecase);
});
