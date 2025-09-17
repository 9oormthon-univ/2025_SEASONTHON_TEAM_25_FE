import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/datasources/remote/achievement_api.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/models/achievement_models.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/domain/repository/achievement_repository.dart';

class AchievementRepositoryImpl implements AchievementRepository {
  final AchievementApi _api;

  AchievementRepositoryImpl(this._api);

  @override
  Future<AchievementListResponse> getAchievements() {
    return _api.getAchievements();
  }

  @override
  Future<ClaimAchievementResponse> claimAchievement(int achievementId) {
    return _api.claimAchievement(achievementId);
  }
}

final achievementRepositoryProvider = Provider<AchievementRepository>((ref) {
  final api = ref.watch(achievementApiProvider);
  return AchievementRepositoryImpl(api);
});
