import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';

class HomeActionBtn extends StatelessWidget {
  const HomeActionBtn({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.showBadge = false,
  });

  final Widget icon;
  final String label;
  final VoidCallback onTap;
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 본체 카드
            Container(
              width: double.infinity, // 부모 Row 기준 균등 분할
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.gr200,
                borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon,
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: AppTypography.m600.copyWith(color: AppColors.gr800),
                  ),
                ],
              ),
            ),

            // 빨간 알림 뱃지
            if (showBadge)
              Positioned(
                top: -4, // 살짝 띄워서 모서리에 걸치게
                right: -4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
