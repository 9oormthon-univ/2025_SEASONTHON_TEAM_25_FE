import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/gradients.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashState();
}

class _SplashState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    // 위젯이 완전히 렌더링된 후 콜백 함수를 실행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToNextPage();
    });
  }

  void _navigateToNextPage() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      context.go('/sign-up');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppGradients.homeBackground),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 로고
              Container(
                decoration: BoxDecoration(
                  color: AppColors.wt,
                  borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
                ),
                width: 56,
                height: 56,
                child: Lottie.asset(
                  Assets.lottie.appLogo,
                  repeat: true,
                  animate: true,
                  fit: BoxFit.contain,
                  frameRate: FrameRate.max,
                ),
              ),
              const SizedBox(width: 13),
              SvgPicture.asset(
                Assets.images.appLogo.logotype.path,
                width: 111.79,
                height: 56,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
