import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class CoinBalanceChip extends StatelessWidget {
  const CoinBalanceChip({
    super.key,
    required this.balance,
    required this.backgroundColor,
    required this.textColor,
  });

  final double balance;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppRadius.chips),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.home.coin.image(
              width: 18,
              height: 18,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 4),
            Text(
              "$balance원",
              style: AppTypography.m500.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
