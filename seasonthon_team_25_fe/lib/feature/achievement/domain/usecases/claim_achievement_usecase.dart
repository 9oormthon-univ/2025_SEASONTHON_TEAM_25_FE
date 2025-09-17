import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/models/achievement_models.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/repository_impl/achievement_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/domain/repository/achievement_repository.dart';

class ClaimAchievementUseCase {
  final AchievementRepository _repository;

  ClaimAchievementUseCase(this._repository);

  Future<ClaimAchievementResponse> call(int achievementId) {
    return _repository.claimAchievement(achievementId);
  }
}

final claimAchievementUseCaseProvider = Provider<ClaimAchievementUseCase>((ref) {
  final repository = ref.watch(achievementRepositoryProvider);
  return ClaimAchievementUseCase(repository);
});
