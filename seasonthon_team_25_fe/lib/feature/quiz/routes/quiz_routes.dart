import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/quiz/ui/quiz_page.dart';

final quizRoutes = <RouteBase>[
  GoRoute(path: '/quiz', builder: (context, state) => const QuizPage()),
];
