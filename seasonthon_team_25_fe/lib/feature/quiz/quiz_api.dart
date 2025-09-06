import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/quiz_models.dart';

class QuizApi {
  final Dio _dio;
  QuizApi(this._dio);

  Future<DailyQuizResponse> fetchDaily() async {
    final res = await _dio.get('/api/quiz/daily');
    final data = (res.data is Map<String, dynamic>)
        ? res.data as Map<String, dynamic>
        : <String, dynamic>{'data': res.data};

    // data 래핑이 있으면 풀기
    final Map<String, dynamic> payload = (data['data'] is Map<String, dynamic>)
        ? data['data'] as Map<String, dynamic>
        : data;

    if (kDebugMode) {
      debugPrint('[QUIZ] daily keys: ${payload.keys}');
    }
    return DailyQuizResponse.fromJson(payload);
  }

  Future<void> submitAnswer({
    required int userQuizId,
    required String userAnswer, // OX: "true"/"false", MCQ: "1".."4"
  }) async {
    await _dio.post(
      '/api/quiz/answer',
      data: {'userQuizId': userQuizId, 'userAnswer': userAnswer},
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
  }
}