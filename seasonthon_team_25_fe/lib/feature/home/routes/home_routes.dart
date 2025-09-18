import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/achievement/page/achievement_page.dart';
import 'package:seasonthon_team_25_fe/ui/attendance/ui/attendance_page.dart';
import 'package:seasonthon_team_25_fe/ui/home/ui/home_page.dart';
import 'package:seasonthon_team_25_fe/ui/quest/ui/quest_page.dart';

final homeRoutes = <RouteBase>[
  GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  GoRoute(
    path: '/attendance',
    builder: (context, state) => const AttendancePage(),
  ),
  GoRoute(path: '/quest', builder: (context, state) => const QuestPage()),
  GoRoute(
    path: '/achievement',
    builder: (context, state) => const AchievementPage(),
  ),
];
