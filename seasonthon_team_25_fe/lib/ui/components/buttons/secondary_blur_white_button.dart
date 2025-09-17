import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/button_size.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
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
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(AppRadius.button),
      child: GestureDetector(
        onTap: isLoading ? null : onPressed,
        child: Container(
          constraints: BoxConstraints(minHeight: 44.0),
          width: _resolveWidth(),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.wt,
            borderRadius: BorderRadius.circular(AppRadius.button),
            boxShadow: AppShadows.dsDefault,
          ),
          child: isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: AppColors.wt,
                    strokeWidth: 2.0,
                  ),
                )
              : Text(
                  label,
                  style: AppTypography.h3.copyWith(color: AppColors.primarySky),
                ),
        ),
      ),
    );
  }
}
