// 금융 상품 가입 완료
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';
import 'package:seasonthon_team_25_fe/ui/components/sk_btn.dart';

class SignUpCompleteArgs {
  final String maturityDate;
  final int autoDebitAmount;
  final int termMonths;

  const SignUpCompleteArgs({
    required this.maturityDate,
    required this.autoDebitAmount,
    required this.termMonths,
  });
}

class FinancialProductSignUpCompletePage extends ConsumerStatefulWidget {
  final SignUpCompleteArgs? args;
  const FinancialProductSignUpCompletePage({super.key, this.args});

  @override
  ConsumerState<FinancialProductSignUpCompletePage> createState() =>
      _FinancialProductSignUpCompletePageState();
}

class _FinancialProductSignUpCompletePageState
    extends ConsumerState<FinancialProductSignUpCompletePage> {
  // final String monthlyBill = "100,000";
  // final int count = 10;
  // final String endDate = "2026-6-31";

  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
  }

  @override
  Widget build(BuildContext context) {
    final maturity = widget.args?.maturityDate ?? '-';
    final amount = widget.args?.autoDebitAmount ?? 0;
    final months = widget.args?.termMonths ?? 0;

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '가입 완료',
        showLeftBtn: false,
        showRightBtn: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentGeometry.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "짝짝짝, 가입이 완료되었어요!",
                    style: AppTypography.h3.copyWith(color: AppColors.bk),
                  ),
                  Text(
                    "$amount원씩 $months회 자동으로 납입될 예정이며,\n만기 예정일은 $maturity일이에요.",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 74),
            Assets.images.onboarding.faffNocircle.image(
              width: 120,
              height: 174.3,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 100),
            PrimaryActionButton(
              isLoading: false,
              label: "가입 내역 보러가기",
              onPressed: () {
                context.go("/bank/in-progress");
              },
            ),
            const SizedBox(height: 12),
            SkyBlueButton(
              isLoading: false,
              label: "홈으로",
              onPressed: () {
                context.go("/home");
              },
            ),
          ],
        ),
      ),
    );
  }
}
