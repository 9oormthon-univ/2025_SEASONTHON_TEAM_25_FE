import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_white_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/secondary_blur_white_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';

import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/home_controller.dart';

class BankPage extends ConsumerStatefulWidget {
  const BankPage({super.key});

  @override
  ConsumerState<BankPage> createState() => _BankPageState();
}

class _BankPageState extends ConsumerState<BankPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(homeControllerProvider.notifier).load();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        isDismissible: false,
        enableDrag: false,
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (context) {
          return const _BottomSheetContent();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeControllerProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomWhiteAppBar(
        title: "나만의 뱅크",
        // showLeftBtn: true,
        // onTapLeftBtn: () {
        //   context.go("/home");
        // },
      ),
      body: homeState.when(
        loading: () => Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: Lottie.asset(
              Assets.lottie.loadingSlow,
              repeat: true, // 반복 재생
              animate: true, // 자동 재생
              fit: BoxFit.contain,
              frameRate: FrameRate.max,
            ),
          ),
        ),
        error: (err, st) => Center(child: Text("에러: $err")),
        data: (data) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff2a94ea), Color(0xfffafafa)],
              ),
            ),
            child: Column(
              spacing: 8,
              children: [
                Assets.images.characters.ffStart.image(
                  width: 150,
                  height: 217.87,
                  fit: BoxFit.contain,
                ),
                Text(
                  "반가워요, ${data.characterName}님!",
                  style: AppTypography.h2.copyWith(color: AppColors.wt),
                ),
                CoinBalanceChip(
                  balance: data.balance,
                  backgroundColor: AppColors.wt_50,
                  textColor: AppColors.primarySky,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  const _BottomSheetContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.wt,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.bottomSheet),
          bottom: Radius.circular(AppRadius.bottomSheet),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 5,
            width: 144,
            decoration: BoxDecoration(
              color: AppColors.gr200,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.topLeft,
            child: Text("뱅크 모드 선택", style: AppTypography.h3),
          ),
          const SizedBox(height: 24),
          SecondaryBlurWhiteButton(
            customWidth: double.infinity,
            label: "진행 중인 금융 상품 보러가기",
            onPressed: () {
              context.push('/bank/inprogress');
            },
          ),
          const SizedBox(height: 16),
          SecondaryBlurWhiteButton(
            customWidth: double.infinity,
            label: "만기된 금융 상품 보러가기",
            onPressed: () {
              context.push('/bank/terminated');
            },
          ),
          const SizedBox(height: 16),
          SecondaryBlurWhiteButton(
            customWidth: double.infinity,
            label: "새로운 금융 상품 보러가기",
            onPressed: () {
              context.go('/bank/list');
            },
          ),
        ],
      ),
    );
  }
}
