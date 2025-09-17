import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/models/scrap_models.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/repository_impl/scrap_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/domain/repository/scrap_repository.dart';

class GetScrapNewsUseCase {
  final ScrapRepository _repository;

  GetScrapNewsUseCase(this._repository);

  Future<ScrapNewsPageResponse> call({
    int page = 0,
    int size = 20,
    String sort = 'scrappedDate,desc',
  }) {
    return _repository.getScrapNews(
      page: page,
      size: size,
      sort: sort,
    );
  }
}

final getScrapNewsUseCaseProvider = Provider<GetScrapNewsUseCase>((ref) {
  final repository = ref.watch(scrapRepositoryProvider);
  return GetScrapNewsUseCase(repository);
});
