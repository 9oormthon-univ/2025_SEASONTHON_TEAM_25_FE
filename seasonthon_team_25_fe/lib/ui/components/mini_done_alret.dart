import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';

class MiniDoneAlret extends StatelessWidget {
  const MiniDoneAlret({
    super.key,
    this.width,
    this.height,
    required this.child,
  });

  final double? width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: width ?? 130,
      height: height ?? 34,
      decoration: BoxDecoration(
        color: Colors.white, // 배경색 필요에 따라 조정
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primarySky.withOpacity(0.5),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}