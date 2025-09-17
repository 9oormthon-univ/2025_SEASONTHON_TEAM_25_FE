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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth * 0.8;
    final double progress = total > 0 ? current / total : 0;
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
                // 텍스트 (1/N)
                Center(
                  child: Text(
                    '$current/$total',
                    style: current != 0
                        ? (current == 5
                              ? AppTypography.s500.copyWith(color: AppColors.wt)
                              : AppTypography.s500.copyWith(
                                  color: AppColors.secondaryRd,
                                ))
                        : AppTypography.s500.copyWith(color: AppColors.gr600),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8), // 바와 텍스트 목록 사이의 간격
          // 텍스트 목록 (1개, 2개, 3개...)
          SizedBox(
            height: 20, // 텍스트가 들어갈 충분한 높이
            child: Stack(
              children: List.generate(total, (index) {
                final number = index + 1;
                final double positionLeft = (barWidth / total) * (index);

                // 라벨 색상 3단계 변경 로직
                Color labelColor;
                if (number < current) {
                  // 이미 채워진 상태
                  labelColor = AppColors.primarySky;
                } else if (number == current) {
                  // 현재 채워지는 상태
                  labelColor = AppColors.secondaryRd;
                } else {
                  // 아무것도 안 채워진 상태 (기본 색상)
                  labelColor = AppColors.gr600;
                }

                return Positioned(
                  left: positionLeft,
                  child: Text(
                    '$number개',
                    style: AppTypography.s500.copyWith(color: labelColor),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
