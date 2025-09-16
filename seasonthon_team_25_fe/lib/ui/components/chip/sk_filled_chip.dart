import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';

class SkFilledChip extends StatelessWidget {
  final String label;
  final TextStyle? textStyle;

  const SkFilledChip({
    super.key,
    required this.label,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.sk_25,
        borderRadius: BorderRadius.circular(AppRadius.chips),
      ),
      child: Text(
        label,
        style:
            textStyle ??
            AppTypography.s500.copyWith(color: AppColors.primarySky),
      ),
    );
  }
}
