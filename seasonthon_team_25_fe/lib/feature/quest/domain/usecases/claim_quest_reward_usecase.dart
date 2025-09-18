import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/quest/data/models/quest_models.dart';
import 'package:seasonthon_team_25_fe/feature/quest/data/repository_impl/quest_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/quest/domain/repository/quest_repository.dart';

class ClaimQuestRewardUseCase {
  final QuestRepository _repository;

  ClaimQuestRewardUseCase(this._repository);

  Future<ClaimQuestRewardResponse> call(int userQuestId) {
    return _repository.claimQuestReward(userQuestId);
  }
}

final claimQuestRewardUseCaseProvider = Provider<ClaimQuestRewardUseCase>((ref) {
  final repository = ref.watch(questRepositoryProvider);
  return ClaimQuestRewardUseCase(repository);
});
