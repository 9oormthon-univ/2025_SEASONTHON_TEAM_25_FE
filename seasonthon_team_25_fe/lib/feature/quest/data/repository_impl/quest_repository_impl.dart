import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/quest/data/datasources/remote/quest_api.dart';
import 'package:seasonthon_team_25_fe/feature/quest/data/models/quest_models.dart';
import 'package:seasonthon_team_25_fe/feature/quest/domain/repository/quest_repository.dart';

class QuestRepositoryImpl implements QuestRepository {
  final QuestApi _api;

  QuestRepositoryImpl(this._api);

  @override
  Future<List<QuestItem>> getCurrentQuests() {
    return _api.getCurrentQuests();
  }

  @override
  Future<ClaimQuestRewardResponse> claimQuestReward(int userQuestId) {
    return _api.claimQuestReward(userQuestId);
  }
}

final questRepositoryProvider = Provider<QuestRepository>((ref) {
  final api = ref.watch(questApiProvider);
  return QuestRepositoryImpl(api);
});
