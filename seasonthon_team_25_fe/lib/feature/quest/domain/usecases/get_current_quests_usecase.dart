import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/quest/data/models/quest_models.dart';
import 'package:seasonthon_team_25_fe/feature/quest/data/repository_impl/quest_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/quest/domain/repository/quest_repository.dart';

class GetCurrentQuestsUseCase {
  final QuestRepository _repository;

  GetCurrentQuestsUseCase(this._repository);

  Future<List<QuestItem>> call() {
    return _repository.getCurrentQuests();
  }
}

final getCurrentQuestsUseCaseProvider = Provider<GetCurrentQuestsUseCase>((ref) {
  final repository = ref.watch(questRepositoryProvider);
  return GetCurrentQuestsUseCase(repository);
});
