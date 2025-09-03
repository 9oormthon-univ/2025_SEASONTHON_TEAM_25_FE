import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/home/ui/home_page.dart';

final homeRoutes = <RouteBase>[
  GoRoute(path: '/home', builder: (context, state) => const HomePage()),
];
