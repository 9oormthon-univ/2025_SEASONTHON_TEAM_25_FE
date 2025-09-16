import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/button_size.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/sk_filled_chip.dart';

class QuizIntroCard extends StatelessWidget {
  final bool isProcessing; // 이미지 에셋
  final String title;
  final String body;
  final String btnText;
  final VoidCallback onPressed;
  final int? remaining;

  const QuizIntroCard({
    super.key,
    required this.isProcessing,
    required this.title,
    required this.body,
    required this.btnText,
    required this.onPressed,
    this.remaining,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      padding: const EdgeInsets.fromLTRB(40, 24, 40, 24),
      decoration: BoxDecoration(
        color: AppColors.wt,
        borderRadius: BorderRadius.circular(AppRadius.button),
        boxShadow: AppShadows.dsDefault,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isProcessing)
            SkFilledChip(
              label: '${remaining ?? '?'}문제 남음',
              textStyle: AppTypography.m500.copyWith(
                color: AppColors.primarySky,
              ),
            ),
          Image(
            image: isProcessing
                ? Assets.images.quiz.retryIcon.provider()
                : Assets.images.quiz.correctIcon.provider(),
            width: 145,
            height: 145,
          ),
          const SizedBox(height: 16),
          Text(title, style: AppTypography.h2, textAlign: TextAlign.center),
          const SizedBox(height: 4),
          Text(
            body,
            style: AppTypography.l500.copyWith(color: AppColors.gr600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          PrimaryFilledButton(
            label: btnText,
            widthType: ButtonWidth.medium,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
