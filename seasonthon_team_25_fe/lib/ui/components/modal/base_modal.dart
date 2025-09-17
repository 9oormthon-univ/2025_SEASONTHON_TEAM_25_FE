import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';

class BaseModal extends StatelessWidget {
  final String text;
  final String description;
  final String buttonText;
  const BaseModal({
    super.key,
    required this.text,
    required this.description,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.chips),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 45),
        decoration: BoxDecoration(
          color: AppColors.wt,
          borderRadius: BorderRadius.circular(AppRadius.chips),
          boxShadow: AppShadows.dsDefault,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // x 닫기 버튼 추가
            Text(text, style: AppTypography.h3),
            const SizedBox(height: 16),
            const Divider(color: AppColors.gr200, height: 1, thickness: 1),
            const SizedBox(height: 24),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTypography.l600.copyWith(color: AppColors.gr800),
            ),
            const SizedBox(height: 24),
            PrimaryFilledButton(
              label: buttonText,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
