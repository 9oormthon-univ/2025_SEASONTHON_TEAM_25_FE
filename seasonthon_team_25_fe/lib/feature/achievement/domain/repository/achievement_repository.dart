import 'package:seasonthon_team_25_fe/feature/achievement/data/models/achievement_models.dart';

abstract class AchievementRepository {
  /// 사용자 업적 목록 조회
  Future<AchievementListResponse> getAchievements();
  
  /// 업적 확인 처리
  Future<ClaimAchievementResponse> claimAchievement(int achievementId);
}
