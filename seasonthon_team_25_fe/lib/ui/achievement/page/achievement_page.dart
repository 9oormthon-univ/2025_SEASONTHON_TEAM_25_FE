import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/coin_controller.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';

class AchievementPage extends ConsumerStatefulWidget {
  const AchievementPage({super.key});

  @override
  ConsumerState<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends ConsumerState<AchievementPage> {
  @override
  void initState() {
    super.initState();
    // 첫 진입 시 자동 로딩
    Future.microtask(() {
      ref.read(coinProvider.notifier).loadBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    // balance 값만 select
    final balance = ref.watch(
      coinProvider.select((state) => state.asData?.value ?? 0),
    );
    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: "업적 확인",
        showLeftBtn: true,
        showRightBtn: false,
        onTapLeftBtn: () {
          context.go("/home");
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 20),
        child: Column(
          children: [
            CoinBalanceChip(
              balance: balance,
              backgroundColor: AppColors.sk_25,
              textColor: AppColors.primarySky,
            ),
          ],
        ),
      ),
    );
  }
}
