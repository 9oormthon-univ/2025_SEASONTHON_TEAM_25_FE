import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';

class ClickableDetailCardInfo extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onLabelTap;
  final VoidCallback? onValueTap;

  const ClickableDetailCardInfo({
    super.key, 
    required this.label, 
    required this.value,
    this.onLabelTap,
    this.onValueTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onLabelTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label, 
              style: AppTypography.l600.copyWith(
                color: onLabelTap != null ? AppColors.secondaryBl : AppColors.gr600,
                decoration: onLabelTap != null ? TextDecoration.underline : null,
                decorationColor: AppColors.secondaryBl,
              ),
            ),
            Text(
              value, 
              style: AppTypography.h3,
            ),
          ],
        ),
      ),
    );
  }
}
