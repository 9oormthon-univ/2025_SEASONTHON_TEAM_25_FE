import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';

class AppShadows {
  static final dsBS = [
    BoxShadow(
      color: AppColors.primarySky.withValues(alpha: .15),
      offset: const Offset(0, -8),
      blurRadius: 12,
    ),
  ];

  static final dsDefault = [
    BoxShadow(
      color: AppColors.primarySky.withValues(alpha: .5),
      offset: const Offset(0, 0),
      blurRadius: 12,
    ),
  ];

  static final dsRED = [
    BoxShadow(
      color: AppColors.secondaryRd.withValues(alpha: .75),
      offset: const Offset(0, 0),
      blurRadius: 12,
    ),
  ];
}
