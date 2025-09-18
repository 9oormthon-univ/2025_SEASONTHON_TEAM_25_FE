import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/feature/quiz/domain/entities/quiz_entity.dart';
import 'package:seasonthon_team_25_fe/ui/quiz/ui/quiz_page.dart';
import 'package:seasonthon_team_25_fe/ui/quiz/ui/quiz_run_page.dart';

final quizRoutes = <RouteBase>[
  GoRoute(path: '/quiz', builder: (context, state) => const QuizPage()),
  GoRoute(
  path: '/quiz/run',
  builder: (context, state) {
    final quizzes = state.extra! as List<QuizEntity>;
    return QuizRunPage(quizzes: quizzes); // Widget 반환
  },
),
];
