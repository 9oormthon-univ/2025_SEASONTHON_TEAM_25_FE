import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/login_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/token_entity.dart';

import '../entities/sign_up_entity.dart';
import '../repositories/auth_repository.dart';

class AuthUsecase {
  final AuthRepository _repo;
  AuthUsecase(this._repo);

  Future<SignUpEntity> signUp({
    required String email,
    required String password,
  }) {
    return _repo.signUp(email: email, password: password);
  }

  Future<LoginEntity> login({required String email, required String password}) {
    return _repo.login(email: email, password: password);
  }

  Future<AuthTokensEntity> refresh({required String refreshToken}) =>
      _repo.refresh(refreshToken: refreshToken);
}
