import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/datasources/remote/scrap_api.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/models/scrap_models.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/domain/repository/scrap_repository.dart';

class ScrapRepositoryImpl implements ScrapRepository {
  final ScrapApi _api;

  ScrapRepositoryImpl(this._api);

  @override
  Future<ScrapResponse> toggleNewsScrap(int newsArticleId) {
    return _api.toggleNewsScrap(newsArticleId);
  }

  @override
  Future<ScrapNewsPageResponse> getScrapNews({
    int page = 0,
    int size = 20,
    String sort = 'scrappedDate,desc',
  }) {
    return _api.getScrapNews(
      page: page,
      size: size,
      sort: sort,
    );
  }

  @override
  Future<QuizScrapResponse> toggleQuizScrap(QuizScrapRequest request) {
    return _api.toggleQuizScrap(request);
  }

  @override
  Future<ScrapQuizPageResponse> getScrapQuiz({
    int page = 0,
    int size = 20,
    String sort = 'scrappedDate,desc',
  }) {
    return _api.getScrapQuiz(
      page: page,
      size: size,
      sort: sort,
    );
  }
}

final scrapRepositoryProvider = Provider<ScrapRepository>((ref) {
  final api = ref.watch(scrapApiProvider);
  return ScrapRepositoryImpl(api);
});
