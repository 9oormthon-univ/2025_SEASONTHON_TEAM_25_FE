import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/bank_page.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/financial_product_list.dart';

final bankRoutes = <RouteBase>[
  GoRoute(path: '/bank', builder: (context, state) => const BankPage()),
  GoRoute(
    path: '/bank/list',
    builder: (context, state) => const FinancialProductListPage(),
  ),
  //GoRoute(path: '/bank/detail', builder: (context, state) => const FinancialProductDetailPage()),
  //   GoRoute(
  //   path: '/bank/detail/:id',
  //   builder: (context, state) {
  //     final id = state.pathParameters['id']!;
  //     return FinancialProductDetailPage(productId: id);
  //   },
  // ),
  //GoRoute(path: '/bank/sign-up', builder: (context, state) => const FinancialProductSignUpPage()),
  //   GoRoute(
  //   path: '/bank/sign-up/:id',
  //   builder: (context, state) {
  //     final id = state.pathParameters['id']!;
  //     return FinancialProductSignUpPage(productId: id);
  //   },
  // ),
  // /bank/sign-up/:id 로 진입 + extra 로 부가 정보 받기
  // GoRoute(
  //   path: '/bank/sign-up/:id',
  //   builder: (context, state) {
  //     final id = int.parse(state.pathParameters['id']!);

  //     final extra = state.extra;
  //     final args = extra is SignUpArgs ? extra : null;

  //     return FinancialProductSignUpPage(
  //       productId: id,
  //       termMonths: args?.termMonths,   // null이면 화면에서 다시 선택/불러오기
  //       maxLimit: args?.maxLimit,
  //       productName: args?.productName,
  //     );
  //   },
  // ),
  //GoRoute(path: '/bank/sign-up-complete', builder: (context, state) => const FinancialProductSignUpCompletePage()),
  //   GoRoute(
  //   path: '/bank/sign-up-complete',
  //   builder: (context, state) {
  //     final args = state.extra as SignUpCompleteArgs?;
  //     return FinancialProductSignUpCompletePage(args: args);
  //   },
  // ),
  // GoRoute(path: '/bank/in-progress', builder: (context, state) => const FinancialProductInProgressPage()),
];
