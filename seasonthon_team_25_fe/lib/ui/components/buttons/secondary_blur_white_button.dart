import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/button_size.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';

class SecondaryBlurWhiteButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final ButtonWidth widthType;
  final double? customWidth;
  
  const SecondaryBlurWhiteButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.widthType = ButtonWidth.large,
    this.customWidth,
  });

  double _resolveWidth() {
    // 직접 입력값이 있으면 최우선
    if (customWidth != null) return customWidth!;
    // 없으면 enum 기반
    return widthType.value;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.button),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isLoading ? null : onPressed,
            child: Container(
              constraints: const BoxConstraints(minHeight: 44.0),
              width: _resolveWidth(),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.wt.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(AppRadius.button),
                border: Border.all(
                  color: AppColors.wt.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: AppColors.primarySky,
                        strokeWidth: 2.0,
                      ),
                    )
                  : Text(
                      label,
                      style: AppTypography.h3.copyWith(color: AppColors.primarySky),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
