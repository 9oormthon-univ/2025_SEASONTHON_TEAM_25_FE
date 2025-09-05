import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/login_entity.dart';

import '../entities/sign_up_entity.dart';

abstract class AuthRepository {
  /// 성공(2xx): SignUpEntity 반환
  /// 실패(4xx/5xx): 예외 던짐
  Future<SignUpEntity> signUp({
    required String email,
    required String password,
  });

  Future<LoginEntity> login({required String email, required String password});
  Future<LoginEntity> refresh({required String refreshToken});
}
