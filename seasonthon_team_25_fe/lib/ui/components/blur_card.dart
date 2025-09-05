import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';

/*
BlurredCard(
  child: ElevatedButton(
    onPressed: () {},
    child: const Text("확인"),
  ),
),
 */

class BlurredCard extends StatelessWidget {
  const BlurredCard({
    super.key,
    required this.child,
    this.width = double.infinity,
    required this.height,
    this.borderRadius = 12,
    this.blurRadius = 12,
    this.spreadRadius = 2,
    this.alpha = .5,
    this.padding,
  });

  final Widget child;
  final double borderRadius;
  final double blurRadius;
  final double spreadRadius;
  final double alpha;
  final EdgeInsets? padding;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.wt, // 바탕 흰색
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: alpha),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}