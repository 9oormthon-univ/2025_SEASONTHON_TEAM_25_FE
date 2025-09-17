import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/models/scrap_models.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/repository_impl/scrap_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/domain/repository/scrap_repository.dart';

class ToggleNewsScrapUseCase {
  final ScrapRepository _repository;

  ToggleNewsScrapUseCase(this._repository);

  Future<ScrapResponse> call(int newsArticleId) {
    return _repository.toggleNewsScrap(newsArticleId);
  }
}

final toggleNewsScrapUseCaseProvider = Provider<ToggleNewsScrapUseCase>((ref) {
  final repository = ref.watch(scrapRepositoryProvider);
  return ToggleNewsScrapUseCase(repository);
});
