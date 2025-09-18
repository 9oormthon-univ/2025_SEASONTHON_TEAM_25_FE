import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/quest/weekly_quest_page.dart';

final weeklyQuestRoutes = <RouteBase>[
  GoRoute(
    path: '/quest/weekly',
    builder: (context, state) => const WeeklyQuestPage(),
  ),
];
