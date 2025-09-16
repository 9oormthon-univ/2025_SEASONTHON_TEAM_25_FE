import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/domain/entities/quiz_entity.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/domain/repositories/quiz_repository.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/data/repository_impl/quiz_repository_impl.dart';

class GetDailyQuizzesUseCase {
  final QuizRepository repository;
  const GetDailyQuizzesUseCase(this.repository);

  Future<DailyQuizEntity> call() => repository.fetchDailyQuizzes();
}

final getDailyQuizzesUseCaseProvider = Provider<GetDailyQuizzesUseCase>((ref) {
  final repo = ref.watch(quizRepositoryProvider);
  return GetDailyQuizzesUseCase(repo);
});
