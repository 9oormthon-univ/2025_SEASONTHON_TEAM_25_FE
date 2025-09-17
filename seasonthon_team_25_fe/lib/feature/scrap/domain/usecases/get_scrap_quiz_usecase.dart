import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/models/scrap_models.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/repository_impl/scrap_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/domain/repository/scrap_repository.dart';

class GetScrapQuizUseCase {
  final ScrapRepository _repository;

  GetScrapQuizUseCase(this._repository);

  Future<ScrapQuizPageResponse> call({
    int page = 0,
    int size = 20,
    String sort = 'scrappedDate,desc',
  }) {
    return _repository.getScrapQuiz(
      page: page,
      size: size,
      sort: sort,
    );
  }
}

final getScrapQuizUseCaseProvider = Provider<GetScrapQuizUseCase>((ref) {
  final repository = ref.watch(scrapRepositoryProvider);
  return GetScrapQuizUseCase(repository);
});
