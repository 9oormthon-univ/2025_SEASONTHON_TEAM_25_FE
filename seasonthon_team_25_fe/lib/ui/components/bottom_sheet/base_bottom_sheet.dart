import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';

class BaseBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final VoidCallback onApply;

  const BaseBottomSheet({
    super.key,
    required this.title,
    required this.child,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.wt,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.bottomSheet),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 핸들바
          Center(
            child: Container(
              height: 5,
              width: 144,
              decoration: BoxDecoration(
                color: AppColors.gr200,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(title, style: AppTypography.h3),
          const SizedBox(height: 24),

          // 내용부
          Expanded(child: child),

          const SizedBox(height: 20),
          PrimaryFilledButton(label: "적용하기", onPressed: onApply),
        ],
      ),
    );
  }
}
