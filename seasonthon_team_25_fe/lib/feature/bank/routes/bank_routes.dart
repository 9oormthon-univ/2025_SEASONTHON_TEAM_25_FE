import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/bank_page.dart';

final bankRoutes = <RouteBase>[
  GoRoute(path: '/bank', builder: (context, state) => const BankPage()),
];
