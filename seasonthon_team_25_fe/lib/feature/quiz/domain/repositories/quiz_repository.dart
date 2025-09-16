import 'package:seasonthon_team_25_fe/feature/quiz/data/models/submit_answer.models.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/domain/entities/quiz_entity.dart';

abstract class QuizRepository {
  Future<DailyQuizEntity> fetchDailyQuizzes();
  Future<SubmitAnswerResponse> submitAnswer(SubmitAnswerRequest req);
}
