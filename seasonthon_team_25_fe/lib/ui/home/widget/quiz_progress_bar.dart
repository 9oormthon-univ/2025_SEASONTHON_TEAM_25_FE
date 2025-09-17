import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';

class QuizProgressBar extends StatelessWidget {
  const QuizProgressBar({
    super.key,
    required this.total,
    required this.current,
  });

  final int total;
  final int current;

  @override
  Widget build(BuildContext context) {
    // 바의 전체 너비를 화면 너비의 80%로 가정
    final double barWidth = MediaQuery.of(context).size.width * 0.8;
    // 현재 진행률을 계산
    final double progress = total > 0 ? current / total : 0;
    // 채워지는 바의 너비를 계산
    final double progressWidth = barWidth * progress;

    return SizedBox(
      width: barWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 프로그레스 바 부분
          Container(
            height: 15,
            decoration: BoxDecoration(
              color: AppColors.gr200,
              borderRadius: BorderRadius.circular(AppRadius.chips),
            ),
            child: Stack(
              children: [
                // 채워지는 바
                Container(
                  width: progressWidth,
                  decoration: BoxDecoration(
                    color: current == 5
                        ? AppColors.primarySky
                        : AppColors.secondaryRd,
                    borderRadius: BorderRadius.circular(AppRadius.chips),
                    boxShadow: current == 5
                        ? AppShadows.dsDefault
                        : AppShadows.dsRED,
                  ),
                ),
                // 텍스트
                Center(
                  child: Text(
                    '$current/$total',
                    style: current == 5
                        ? AppTypography.s500.copyWith(
                            color: AppColors.secondaryRd,
                          )
                        : AppTypography.s500.copyWith(color: AppColors.wt),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8), // 바와 텍스트 목록 사이의 간격
          // 2. 텍스트 목록 부분 (1개, 2개, 3개...)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(total, (index) {
              final number = index + 1;
              final bool isCurrent = number == current;
              return Text(
                '$number개',
                style: isCurrent
                    ? AppTypography.s500.copyWith(color: AppColors.primarySky)
                    : AppTypography.s500.copyWith(color: AppColors.gr600),
              );
            }),
          ),
        ],
      ),
    );
  }
}
