import 'package:seasonthon_team_25_fe/feature/onboarding/domain/entities/nick_name_entity.dart';

abstract class OnboardingRepository {
  Future<NickNameEntity> createName(String characterName);
}
