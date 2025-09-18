// 금융 상품 가입 완료
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/speech_bubble/speech_bubble.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  bool _celebrateTime = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _celebrateTime = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '가입 완료',
        showLeftBtn: false,
        showRightBtn: true,
        onTapRightBtn: () => context.go("/login"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 47, 20, 57),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("짝짝짝, 가입이 완료되었어요!", style: AppTypography.h2),
                        Text(
                          "앞으로 파프와 함께 다양한 금융 경험을 쌓아 보아요",
                          style: AppTypography.l500.copyWith(
                            color: AppColors.gr600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 73),
                  Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Assets.images.characters.faffLove.image(
                        width: 166.4,
                        height: 226.59,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        top: -40,
                        child: SpeechBubble(
                          nip: BubbleNip.bottomCenter,
                          color: AppColors.wt,
                          radius: AppRadius.button,
                          elevation: 8,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Text(
                            "환영해요!",
                            style: AppTypography.m600.copyWith(
                              color: AppColors.secondaryBl,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                  PrimaryFilledButton(
                    label: "시작하기",
                    onPressed: () {
                      context.go("/home");
                    },
                  ),
                ],
              ),
            ),
          ),
          if (_celebrateTime) ...[
            Center(
              child: SizedBox(
                width: 800,
                height: 800,
                child: Lottie.asset(
                  Assets.lottie.confetti,
                  repeat: true,
                  onLoaded: (composition) {
                    Future.delayed(composition.duration, () {
                      if (mounted) setState(() => _celebrateTime = false);
                    });
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
