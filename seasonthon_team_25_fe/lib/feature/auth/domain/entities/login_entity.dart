import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/token_entity.dart';
import 'package:seasonthon_team_25_fe/feature/auth/domain/entities/user_entity.dart';

class LoginEntity {
  final AuthTokensEntity tokens;
  final UserEntity user;

  const LoginEntity({required this.tokens, required this.user});
}
