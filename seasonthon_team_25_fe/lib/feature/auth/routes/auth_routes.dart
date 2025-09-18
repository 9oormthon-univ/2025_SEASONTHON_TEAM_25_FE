import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/auth/ui/login_page.dart';
import 'package:seasonthon_team_25_fe/ui/auth/ui/sign_up_page.dart';
//import 'package:seasonthon_team_25_fe/ui/splash/splash.dart';

final authRoutes = <RouteBase>[
  GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
  GoRoute(path: '/sign-up', builder: (context, state) => const SignUpPage()),
];
