import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/coin_controller.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';

class TerminatedSavingsPage extends ConsumerStatefulWidget {
  const TerminatedSavingsPage({super.key});

  @override
  ConsumerState<TerminatedSavingsPage> createState() =>
      _TerminatedSavingsPageState();
}

class _TerminatedSavingsPageState extends ConsumerState<TerminatedSavingsPage> {
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
        title: '만기된 금융 상품',
        showLeftBtn: true,
        showRightBtn: false,
        onTapLeftBtn: () {
          context.go("/bank");
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.topLeft,
              child: CoinBalanceChip(
                balance: balance.toInt(),
                backgroundColor: AppColors.sk_25,
                textColor: AppColors.primarySky,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Text(
                    "만기된 금융 상품이 없습니다",
                    style: AppTypography.h3.copyWith(
                      color: AppColors.primarySky,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "힌트: 금융 상품을 만기하여 칭호를 획득해보세요!",
                    style: AppTypography.l400.copyWith(color: AppColors.sk_50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
