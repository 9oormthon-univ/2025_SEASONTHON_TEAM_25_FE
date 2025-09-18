import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class RewardBox extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final String? imageAsset;

  const RewardBox({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SvgPicture.asset(
          //   imageAsset ?? Assets.images.components.iconReward1.path,
          //   height: 18,
          //   width: 18,
          // ),
          Assets.images.components.iconReward.image(
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                ),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTypography.m500.copyWith(color: AppColors.primarySky),
          ),
        ],
      ),
    );
  }
}
