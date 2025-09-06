import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/quiz/ui/quiz_page.dart';
import 'package:seasonthon_team_25_fe/ui/quiz/ui/quiz_question.dart';
import 'package:seasonthon_team_25_fe/ui/test/quiz/view/test_quiz.dart';

final quizRoutes = <RouteBase>[
  GoRoute(path: '/quiz', builder: (context, state) => const QuizPage()),
  GoRoute(path: '/quiz-question', builder: (context, state) => const QuizQuestionPage()),
  GoRoute(path: '/test-quiz', builder: (context, state) => const TestQuizPage()),
];
