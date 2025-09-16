import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';

class RoundedTextBox extends StatelessWidget {
  final String text;

  const RoundedTextBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16, // 좌우 여백
        vertical: 8,   // 상하 여백
      ),
      decoration: BoxDecoration(
        color: AppColors.secondarySk.withValues(alpha: 0.25), // 배경색
        borderRadius: BorderRadius.circular(24), // 모서리 둥글게
      ),
      child: Text(
        text,
        style: AppTypography.m500.copyWith(color: AppColors.primarySky)
      ),
    );
  }
}