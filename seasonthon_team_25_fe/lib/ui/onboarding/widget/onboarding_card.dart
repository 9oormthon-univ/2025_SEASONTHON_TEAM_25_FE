import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class OnboardingVisual1 extends StatelessWidget {
  const OnboardingVisual1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Assets.images.onboarding.onboardingImg1.image(
              fit: BoxFit.cover,
            ),
          ),
          //Lottie.asset('assets/lottie/effect1.json', width: 200, height: 200),
        ],
      ),
    );
  }
}

class OnboardingVisual2 extends StatelessWidget {
  const OnboardingVisual2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      height: 300,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Lottie.asset('assets/lottie/effect2.json', width: 300, height: 300),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Assets.images.onboarding.onboardingImg2.image(
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingVisual3 extends StatelessWidget {
  const OnboardingVisual3({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      height: 300,
      child: Lottie.asset(
        Assets.lottie.onboarding3Card,
        width: 300,
        height: 300,
      ),
    );
  }
}
