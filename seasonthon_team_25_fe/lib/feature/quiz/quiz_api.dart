import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/quiz_models.dart';

final quizApiProvider = Provider<QuizApi>((ref) {
  final dio = ref.watch(dioProvider);
  return QuizApi(dio);
});

class QuizApi {
  final Dio _dio;
  QuizApi(this._dio);

  Future<DailyQuizResponse> fetchDaily() async {
    final res = await _dio.get('/api/quiz/daily');
    return DailyQuizResponse.fromJson(res.data as Map<String, dynamic>);
  }

  /// userAnswer는 **OX: bool, MCQ: int(1-based)** 로 보냅니다.
  Future<void> submitAnswer({
    required int userQuizId,
    required Object? userAnswer, // bool 또는 int
  }) async {
    await _dio.post(
      '/api/quiz/answers',
      data: {
        'userQuizId': userQuizId,
        'userAnswer': userAnswer,
      },
    );
  }
}