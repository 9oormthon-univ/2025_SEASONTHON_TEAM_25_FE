import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/models/scrap_models.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/repository_impl/scrap_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/domain/repository/scrap_repository.dart';

class ToggleQuizScrapUseCase {
  final ScrapRepository _repository;

  ToggleQuizScrapUseCase(this._repository);

  Future<QuizScrapResponse> call(int userQuizId, bool isCorrect) {
    final request = QuizScrapRequest(
      userQuizId: userQuizId,
      isCorrect: isCorrect,
    );
    return _repository.toggleQuizScrap(request);
  }
}

final toggleQuizScrapUseCaseProvider = Provider<ToggleQuizScrapUseCase>((ref) {
  final repository = ref.watch(scrapRepositoryProvider);
  return ToggleQuizScrapUseCase(repository);
});
