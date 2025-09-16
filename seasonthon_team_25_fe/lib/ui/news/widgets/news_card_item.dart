import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/sk_filled_chip.dart';
import 'package:seasonthon_team_25_fe/ui/components/img/html_image.dart';

class NewsCardItem extends StatelessWidget {
  final String title;
  final String date;
  final String aiSummary;
  final String ministerCode;
  final String thumbnailUrl;

  const NewsCardItem({
    super.key,
    required this.title,
    required this.date,
    required this.aiSummary,
    required this.ministerCode,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(AppRadius.chips);
    final hasThumb = thumbnailUrl.trim().isNotEmpty;
    //final hasMinister = ministerCode.trim().isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.wt,
        borderRadius: radius,
        boxShadow: AppShadows.dsDefault,
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 제목
              Text(
                title,
                style: AppTypography.h3,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              // 날짜
              Text(
                date,
                style: AppTypography.m500.copyWith(color: AppColors.gr600),
              ),
              const SizedBox(height: 12),

              // 구분선
              const Divider(height: 25, thickness: 1, color: AppColors.gr200),

              // 썸네일
              if (hasThumb) ...[
                HtmlImage(
                  url: thumbnailUrl,
                  width: double.infinity,
                  height: 175,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(12),
                ),
                const SizedBox(height: 16),
              ],

              // AI 요약
              Align(
                alignment: Alignment.centerLeft,
                child: SkFilledChip(label: 'AI 요약'),
              ),
              const SizedBox(height: 4),

              Text(
                aiSummary,
                style: AppTypography.m500.copyWith(color: AppColors.primarySky),
                softWrap: true,
              ),
              const SizedBox(height: 8),

              // 출처/부처 코드
              Text(
                "출처: <대한민국 정책 브리핑>",
                style: AppTypography.s400.copyWith(color: AppColors.gr600),
              ),
              // if (hasMinister)
              //   Text(
              //     ministerCode,
              //     style: AppTypography.s400.copyWith(color: AppColors.gr600),
              //     maxLines: 1,
              //     overflow: TextOverflow.ellipsis,
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
