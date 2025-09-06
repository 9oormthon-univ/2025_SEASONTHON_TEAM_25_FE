// // lib/feature/quiz/repository/quiz.dart
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // 필요에 맞게 경로 확인하세요. (전역 Dio 주입부)
// import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';

// /// =======================
// /// Models / DTO
// /// =======================

// class QuizItem {
//   final int userQuizId;         // API의 userQuizId
//   final String type;            // "OX" or "MCQ"
//   final String question;        // 문제 본문
//   final List<String>? mcqOptions; // MCQ 보기 (O/X는 null)
//   final String correctAnswer;   // "true"/"false" or "1"~"4"

//   const QuizItem({
//     required this.userQuizId,
//     required this.type,
//     required this.question,
//     required this.correctAnswer,
//     this.mcqOptions,
//   });

//   /// ⚠️ 방어적 파싱: 키 후보들을 순서대로 확인, 타입도 안전히 변환
//   factory QuizItem.fromJson(Map<String, dynamic> json) {
//     final type = (json['type'] ?? json['quizType'] ?? 'MCQ').toString();
//     final question = (json['question'] ?? json['title'] ?? '').toString();

//     // 정답 키 후보
//     final rawCorrect =
//         json['correctAnswer'] ??
//         json['answer'] ??
//         json['correct'] ??
//         (json['meta'] is Map ? (json['meta'] as Map)['correctAnswer'] : null) ??
//         '';

//     // 보기 키 후보
//     final rawOptions =
//         json['options'] ??
//         json['choices'] ??
//         (json['mcq'] is Map ? (json['mcq'] as Map)['options'] : null);

//     final options = (rawOptions is List)
//         ? rawOptions.map((e) => e.toString()).toList()
//         : null;

//     // userQuizId 키 후보
//     final dynamic idCandidate = json['userQuizId'] ?? json['id'];
//     final int id = switch (idCandidate) {
//       int v => v,
//       String v => int.tryParse(v) ?? 0,
//       _ => 0,
//     };

//     return QuizItem(
//       userQuizId: id,
//       type: type,
//       question: question,
//       correctAnswer: _normalizeAnswer(rawCorrect.toString()),
//       mcqOptions: options,
//     );
//   }
// }

// class DailyQuizDto {
//   final bool completed;
//   final List<QuizItem> items;

//   DailyQuizDto({
//     required this.completed,
//     required this.items,
//   });

//   /// ⚠️ 방어적 파싱: items/quizzes/content/data.items 등 다양한 래핑 구조 허용
//   factory DailyQuizDto.fromJson(Map<String, dynamic> json) {
//     // 1) completed 플래그
//     final completed = (json['completed'] as bool?) ??
//         (json['data'] is Map ? (json['data']['completed'] as bool?) : null) ??
//         false;

//     // 2) 리스트가 들어있을만한 후보 경로들
//     dynamic rawList =
//         json['items'] ??
//         json['quizzes'] ??
//         json['content'] ??
//         (json['data'] is Map ? json['data']['items'] : null) ??
//         (json['data'] is Map ? json['data']['quizzes'] : null);

//     // 3) null-safe로 List 변환
//     final List list = (rawList is List) ? rawList : const [];

//     // 4) 각 요소를 Map으로 강제 변환 후 파싱
//     final parsed = list
//         .whereType<Map>() // dynamic 섞여 있으면 필터링
//         .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
//         .map(QuizItem.fromJson)
//         .toList();

//     return DailyQuizDto(completed: completed, items: parsed);
//   }
// }

// /// =======================
// /// State
// /// =======================

// class QuizSessionState {
//   final bool loading;
//   final String? error;
//   final List<QuizItem> quizzes;
//   final int currentIndex;
//   final bool completed;

//   /// 처음 받아온 정답: userQuizId -> "true"/"false" or "1"~"4"
//   final Map<int, String> correctById;

//   /// 사용자가 고른 답: userQuizId -> "true"/"false" or "1"~"4"
//   final Map<int, String> userAnswers;

//   /// 오답 모음(프론트 판정 기준)
//   final Set<int> wrongIds;

//   bool get hasData => quizzes.isNotEmpty;
//   bool get isLast => currentIndex >= quizzes.length - 1;

//   const QuizSessionState({
//     this.loading = false,
//     this.error,
//     this.quizzes = const [],
//     this.currentIndex = 0,
//     this.completed = false,
//     this.correctById = const {},
//     this.userAnswers = const {},
//     this.wrongIds = const {},
//   });

//   QuizSessionState copyWith({
//     bool? loading,
//     String? error, // null로 지우고 싶으면 명시적으로 전달
//     List<QuizItem>? quizzes,
//     int? currentIndex,
//     bool? completed,
//     Map<int, String>? correctById,
//     Map<int, String>? userAnswers,
//     Set<int>? wrongIds,
//   }) {
//     return QuizSessionState(
//       loading: loading ?? this.loading,
//       error: error,
//       quizzes: quizzes ?? this.quizzes,
//       currentIndex: currentIndex ?? this.currentIndex,
//       completed: completed ?? this.completed,
//       correctById: correctById ?? this.correctById,
//       userAnswers: userAnswers ?? this.userAnswers,
//       wrongIds: wrongIds ?? this.wrongIds,
//     );
//   }
// }

// /// =======================
// /// Notifier
// /// =======================

// class QuizSessionNotifier extends StateNotifier<QuizSessionState> {
//   QuizSessionNotifier(this._api) : super(const QuizSessionState());

//   final QuizApi _api;

//   Future<void> loadDaily() async {
//     try {
//       state = state.copyWith(loading: true, error: null);

//       final daily = await _api.fetchDailyQuiz(); // 서버 호출

//       // 🚩 여기서 null List가 오면 이전엔 터졌음 → 방어 파서로 해결됨
//       final items = daily.items;

//       // 처음 로드 시 정답 맵 구성
//       final Map<int, String> correct = {
//         for (final q in items) q.userQuizId: q.correctAnswer,
//       };

//       state = state.copyWith(
//         loading: false,
//         quizzes: items,
//         currentIndex: 0,
//         completed: daily.completed,
//         correctById: correct,
//         userAnswers: {},
//         wrongIds: {},
//         error: null,
//       );

//       if (kDebugMode) {
//         final summary = correct.entries.map((e) => '${e.key}:${e.value}').join(', ');
//         debugPrint('[QUIZ] loaded correctById { $summary }');
//       }
//     } catch (e) {
//       state = state.copyWith(loading: false, error: e.toString());
//     }
//   }

//   String? correctOf(int userQuizId) => state.correctById[userQuizId];

//   /// OX 제출 헬퍼
//   Future<void> answerOx(bool value) {
//     final q = state.quizzes[state.currentIndex];
//     final ans = value ? 'true' : 'false';
//     return submitAnswer(userQuizId: q.userQuizId, userAnswer: ans);
//   }

//   /// MCQ 제출 헬퍼 (index는 0-based → "1"~)
//   Future<void> answerMcq(int selectedIndex) {
//     final q = state.quizzes[state.currentIndex];
//     final ans = '${selectedIndex + 1}';
//     return submitAnswer(userQuizId: q.userQuizId, userAnswer: ans);
//   }

//   /// 공통 제출
//   Future<void> submitAnswer({
//     required int userQuizId,
//     required String userAnswer,
//   }) async {
//     final norm = _normalizeAnswer(userAnswer);

//     // 1) 낙관적 반영 + 프론트 판정
//     final newAnswers = Map<int, String>.from(state.userAnswers)..[userQuizId] = norm;

//     final correct = state.correctById[userQuizId];
//     final bool isCorrect = (correct != null && norm == correct);

//     final newWrongs = Set<int>.from(state.wrongIds);
//     if (isCorrect) {
//       newWrongs.remove(userQuizId);
//     } else {
//       newWrongs.add(userQuizId);
//     }

//     state = state.copyWith(
//       userAnswers: newAnswers,
//       wrongIds: newWrongs,
//       error: null,
//     );

//     // 2) 서버 제출
//     try {
//       await _api.postAnswer(userQuizId: userQuizId, userAnswer: userAnswer);
//     } catch (e) {
//       log('[QUIZ] submit failed: $e');
//       state = state.copyWith(error: '제출 실패: $e');
//       // 필요 시 롤백 로직 추가 가능
//     }
//   }

//   /// 다음 문제로 이동 (마지막이면 completed)
//   void next() {
//     if (state.isLast) {
//       state = state.copyWith(completed: true, error: null);
//     } else {
//       state = state.copyWith(currentIndex: state.currentIndex + 1, error: null);
//     }
//   }
// }

// /// =======================
// /// API
// /// =======================

// class QuizApi {
//   QuizApi(this._dio);
//   final Dio _dio;

//   Future<DailyQuizDto> fetchDailyQuiz() async {
//     final res = await _dio.get('/api/quiz/daily');

//     // 루트가 Map이 아닐 수도 있으므로 래핑
//     final root = res.data;
//     final Map<String, dynamic> json = switch (root) {
//       final Map<String, dynamic> m => m,
//       _ => <String, dynamic>{'data': root},
//     };

//     // data 아래에 감싸져 있으면 꺼내서 파싱
//     final Map<String, dynamic> payload = switch (json['data']) {
//       final Map<String, dynamic> d => d,
//       _ => json,
//     };

//     if (kDebugMode) {
//       debugPrint('[QUIZ] daily raw keys: ${json.keys}');
//       debugPrint('[QUIZ] payload keys: ${payload.keys}');
//     }

//     return DailyQuizDto.fromJson(payload);
//   }

//   Future<void> postAnswer({
//     required int userQuizId,
//     required String userAnswer,
//   }) async {
//     await _dio.post(
//       '/api/quiz/answer',
//       data: {
//         'userQuizId': userQuizId,
//         'userAnswer': userAnswer,
//       },
//       options: Options(
//         headers: {
//           'Content-Type': 'application/json',
//           // Authorization은 전역 인터셉터에서 주입 중이면 생략
//         },
//       ),
//     );
//   }
// }

// /// =======================
// /// Providers
// /// =======================

// final quizApiProvider = Provider<QuizApi>((ref) {
//   final dio = ref.watch(dioProvider); // 전역 Dio 주입
//   return QuizApi(dio);
// });

// final quizSessionProvider =
//     StateNotifierProvider<QuizSessionNotifier, QuizSessionState>((ref) {
//   final api = ref.watch(quizApiProvider);
//   return QuizSessionNotifier(api);
// });

// /// =======================
// /// Utils
// /// =======================

// String _normalizeAnswer(String v) {
//   final s = v.trim().toLowerCase();
//   // OX 표현 다양성 흡수 (선택)
//   if (s == 'o' || s == 'true' || s == '1') return 'true';
//   if (s == 'x' || s == 'false' || s == '0') return 'false';
//   // MCQ "1"~"4" 등은 그대로
//   return s;
// }