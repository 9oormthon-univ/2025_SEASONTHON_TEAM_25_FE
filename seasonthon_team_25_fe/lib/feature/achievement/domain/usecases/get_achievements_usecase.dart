import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/models/achievement_models.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/repository_impl/achievement_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/domain/repository/achievement_repository.dart';

class GetAchievementsUseCase {
  final AchievementRepository _repository;

  GetAchievementsUseCase(this._repository);

  Future<AchievementListResponse> call() {
    return _repository.getAchievements();
  }
}

final getAchievementsUseCaseProvider = Provider<GetAchievementsUseCase>((ref) {
  final repository = ref.watch(achievementRepositoryProvider);
  return GetAchievementsUseCase(repository);
});
