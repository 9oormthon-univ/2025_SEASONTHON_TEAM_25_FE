import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/splash/page/splash.dart';

final splashRoutes = <RouteBase>[
  GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
];
