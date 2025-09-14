import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/domain/entities/nick_name_entity.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/repositoryImpl/onboarding_repository_impl.dart';

class OnboardingUsecase {
  final OnboardingRepository _repo;
  OnboardingUsecase(this._repo);

  Future<NickNameEntity> createNickName(String name) {
    return _repo.createName(name.trim());
  }
}

/// DI
final onboardingUsecaseProvider = Provider<OnboardingUsecase>((ref) {
  final repo = ref.watch(onboardingRepositoryProvider);
  return OnboardingUsecase(repo);
});
