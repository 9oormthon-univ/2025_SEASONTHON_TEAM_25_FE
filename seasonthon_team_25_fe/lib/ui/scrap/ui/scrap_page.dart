import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class ScrapPage extends ConsumerStatefulWidget {
  const ScrapPage({super.key});

  @override
  ConsumerState<ScrapPage> createState() => _ScrapPageState();
}

class _ScrapPageState extends ConsumerState<ScrapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wt,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset(
                  Assets.lottie.test2Confetti,
                  repeat: true,
                  animate: true,
                  fit: BoxFit.contain,
                  frameRate: FrameRate.max,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset(
                  Assets.lottie.appLogo,
                  repeat: true,
                  animate: true,
                  fit: BoxFit.contain,
                  frameRate: FrameRate.max,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset(
                  Assets.lottie.test2Loading,
                  repeat: true,
                  animate: true,
                  fit: BoxFit.contain,
                  frameRate: FrameRate.max,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset(
                  Assets.lottie.loadingReversed,
                  repeat: true,
                  animate: true,
                  fit: BoxFit.contain,
                  frameRate: FrameRate.max,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
