import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/onboarding/pages/nickname_page.dart';
import 'package:seasonthon_team_25_fe/ui/onboarding/pages/onboarding.dart';
import 'package:seasonthon_team_25_fe/ui/onboarding/pages/welcom_page.dart';

final onboardingRoutes = <RouteBase>[
  GoRoute(
    path: '/onboarding',
    builder: (context, state) => const OnboardingPage(),
  ),
  GoRoute(
    path: '/nickname',
    builder: (context, state) => const NicknamePage(),
  ),
  GoRoute(
    path: '/welcome',
    builder: (context, state) => const WelcomePage(),
  ),
];
