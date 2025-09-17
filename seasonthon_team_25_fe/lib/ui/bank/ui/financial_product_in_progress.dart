import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/button_size.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/coin_controller.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/secondary_white_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';

class FinancialProductInProgressPage extends ConsumerStatefulWidget {
  const FinancialProductInProgressPage({super.key});

  @override
  ConsumerState<FinancialProductInProgressPage> createState() =>
      _FinancialProductInProgressPageState();
}

class _FinancialProductInProgressPageState
    extends ConsumerState<FinancialProductInProgressPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(coinProvider.notifier).loadBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    final balance = ref.watch(
      coinProvider.select((state) => state.asData?.value ?? 0),
    );

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '진행 중인 금융 상품',
        showLeftBtn: true,
        showRightBtn: false,
        onTapLeftBtn: () {
          context.go("/bank");
        },
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          CoinBalanceChip(
            balance: balance,
            backgroundColor: AppColors.sk_25,
            textColor: AppColors.primarySky,
          ),
          const SizedBox(height: 24),
          // 진행 중인 금융 상품 카드
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryFilledButton(
                widthType: ButtonWidth.medium,
                label: "입금하기",
                onPressed: () {
                  debugPrint("입금하기 버튼 클릭!");
                },
              ),
              SecondaryWhiteButton(
                widthType: ButtonWidth.small,
                label: "해지하기",
                onPressed: () {
                  debugPrint("해지하기 버튼 클릭!");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
