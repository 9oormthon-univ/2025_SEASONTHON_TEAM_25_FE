import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/data/datasources/remote/quiz_api.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/data/models/daily_quiz_models.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/data/models/submit_answer.models.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/domain/entities/quiz_entity.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizApi api;
  const QuizRepositoryImpl(this.api);

  @override
  Future<DailyQuizEntity> fetchDailyQuizzes() async {
    try {
      final res = await api.getDailyQuizzes();

      final quizzes = res.quizzes.map((q) {
        final type = (q.type == QuizType.mcq)
            ? QuizTypeEntity.mcq
            : QuizTypeEntity.ox;

        return QuizEntity(
          userQuizId: q.userQuizId,
          quizId: q.quizId,
          type: type,
          question: q.question,
          options: q.mcqOptions,
        );
      }).toList();

      return DailyQuizEntity(quizzes: quizzes, completed: res.completed);
    } on DioException catch (e) {
      final data = e.response?.data;
      // 에러 메시지 파싱 보강: Map 또는 String(JSON)
      try {
        if (data is Map<String, dynamic>) {
          final err = ApiErrorResponse.fromJson(data);
          throw Exception(err.message);
        } else if (data is String) {
          final map = jsonDecode(data) as Map<String, dynamic>;
          final err = ApiErrorResponse.fromJson(map);
          throw Exception(err.message);
        }
      } catch (_) {
        /* fallthrough */
      }
      rethrow;
    }
  }

  @override
  Future<SubmitAnswerResponse> submitAnswer(SubmitAnswerRequest req) async {
    try {
      final res = await api.submitAnswer(req);
      return res;
    } on DioException catch (e) {
      _rethrowWithApiMessage(e);
    }
  }

  Never _rethrowWithApiMessage(DioException e) {
    final data = e.response?.data;
    try {
      if (data is Map<String, dynamic>) {
        final err = ApiErrorResponse.fromJson(data);
        throw Exception(err.message);
      } else if (data is String) {
        final map = jsonDecode(data) as Map<String, dynamic>;
        final err = ApiErrorResponse.fromJson(map);
        throw Exception(err.message);
      }
    } catch (_) {
      /* ignore */
    }
    throw e;
  }
}

final quizRepositoryProvider = Provider<QuizRepository>((ref) {
  final api = ref.watch(quizApiProvider);
  return QuizRepositoryImpl(api);
});
