import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/bank_page.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/financialProductInProgress.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/financial_product_detail.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/financial_product_list.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/financial_product_sign_up.dart';
import 'package:seasonthon_team_25_fe/ui/bank/ui/financial_product_sign_up_complete.dart';

final bankRoutes = <RouteBase>[
  GoRoute(path: '/bank', builder: (context, state) => const BankPage()),
  GoRoute(path: '/bank/list', builder: (context, state) => const FinancialProductListPage()),
  GoRoute(path: '/bank/detail', builder: (context, state) => const FinancialProductDetailPage()),
  GoRoute(path: '/bank/sign-up', builder: (context, state) => const FinancialProductSignUpPage()),
  GoRoute(path: '/bank/sign-up-complete', builder: (context, state) => const FinancialProductSignUpCompletePage()),
  GoRoute(path: '/bank/in-progress', builder: (context, state) => const FinancialProductInProgressPage()),
];
