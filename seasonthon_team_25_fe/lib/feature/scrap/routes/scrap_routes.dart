import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/scrap/ui/scrap_page.dart';

final scrapRoutes = <RouteBase>[
  GoRoute(path: '/scrap', builder: (context, state) => const ScrapPage()),
];
