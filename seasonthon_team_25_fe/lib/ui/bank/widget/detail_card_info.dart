import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';

class DetailCardInfo extends StatelessWidget {
  final String label;
  final String value;

  const DetailCardInfo({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(label, style: AppTypography.l600.copyWith(color: AppColors.gr600)),
      Text(value, style: AppTypography.h3),
      ],
    );
  }
}
