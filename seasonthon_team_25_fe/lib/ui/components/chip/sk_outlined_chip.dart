import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';

class SkOutlinedChip extends StatelessWidget {
  final String label;

  const SkOutlinedChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.wt,
        borderRadius: BorderRadius.circular(AppRadius.chips),
        boxShadow: AppShadows.dsDefault,
      ),
      child: Text(
        label,
        style: AppTypography.m500.copyWith(color: AppColors.primarySky),
      ),
    );
  }
}
