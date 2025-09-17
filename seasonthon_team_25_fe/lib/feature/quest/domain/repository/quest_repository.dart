import 'package:seasonthon_team_25_fe/feature/quest/data/models/quest_models.dart';

abstract class QuestRepository {
  /// 현재 주차 퀘스트 조회
  Future<List<QuestItem>> getCurrentQuests();

  /// 퀘스트 보상 수령
  Future<ClaimQuestRewardResponse> claimQuestReward(int userQuestId);
}
