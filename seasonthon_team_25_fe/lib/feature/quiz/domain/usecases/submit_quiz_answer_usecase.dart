import 'package:seasonthon_team_25_fe/feature/quiz/data/models/submit_answer.models.dart';

import '../repositories/quiz_repository.dart';

class SubmitQuizAnswerUseCase {
  final QuizRepository _repo;
  SubmitQuizAnswerUseCase(this._repo);

  Future<SubmitAnswerResponse> call(SubmitAnswerRequest req) {
    return _repo.submitAnswer(req);
  }
}
