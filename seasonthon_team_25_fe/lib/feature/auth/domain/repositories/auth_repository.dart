import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/login_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/token_entity.dart';

import '../entities/sign_up_entity.dart';

abstract class AuthRepository {
  Future<SignUpEntity> signUp({
    required String email,
    required String password,
  });
  Future<LoginEntity> login({required String email, required String password});
  Future<AuthTokensEntity> refresh({required String refreshToken});
}
