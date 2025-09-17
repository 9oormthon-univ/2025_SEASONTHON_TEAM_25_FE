import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/bank_page.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/financial_product_detail.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/financial_product_list.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/financial_product_sign_up.dart';

final bankRoutes = <RouteBase>[
  GoRoute(path: '/bank', builder: (context, state) => const BankPage()),
  GoRoute(
    path: '/bank/list',
    builder: (context, state) => const FinancialProductListPage(),
  ),
  GoRoute(
    path: '/bank/detail/:id',
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      return FinancialProductDetailPage(productId: id);
    },
  ),
  GoRoute(
    path: '/bank/signup/:id',
    builder: (context, state) {
      final id = state.pathParameters['id']!;
      return FinancialProductSignUpPage(productId: id);
    },
  ),
];
