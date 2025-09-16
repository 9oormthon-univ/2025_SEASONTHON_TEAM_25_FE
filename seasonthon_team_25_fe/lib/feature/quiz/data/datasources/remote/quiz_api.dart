import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/data/models/daily_quiz_models.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/data/models/submit_answer.models.dart';

part 'quiz_api.g.dart';

@RestApi()
abstract class QuizApi {
  factory QuizApi(Dio dio, {String baseUrl}) = _QuizApi;

  @GET('/api/quiz/daily')
  Future<DailyQuizResponse> getDailyQuizzes();

  @POST('/api/quiz/answer')
  Future<SubmitAnswerResponse> submitAnswer(@Body() SubmitAnswerRequest req);
}

final quizApiProvider = Provider<QuizApi>((ref) {
  final dio = ref.watch(dioProvider);
  return QuizApi(dio);
});
