import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class FinancialListItem extends StatelessWidget {
  final String title;
  final String bank;
  final String aiSummary;
  final VoidCallback onPressed;

  const FinancialListItem({
    super.key,
    required this.title,
    required this.bank,
    required this.aiSummary,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
      child: Row(
        children: [
          // 왼쪽 텍스트 2줄
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: AppTypography.h3),
              const SizedBox(width: 12),
              Text(
                bank,
                style: AppTypography.m500.copyWith(
            color: AppColors.gr600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
            SizedBox(
            width: 220, // 원하는 넓이로 지정
            child: Text(
              aiSummary,
              style: AppTypography.m500.copyWith(
              color: AppColors.primarySky,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            ),
              ],
            ),
          ),

          // 오른쪽 아이콘 버튼 (클릭 시 그림자 제거)
          IconButton(
            onPressed: onPressed,
            icon: Assets.images.bank.goDetailBtn.image(
              width: 48,
              height: 48,
              fit: BoxFit.contain,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}
