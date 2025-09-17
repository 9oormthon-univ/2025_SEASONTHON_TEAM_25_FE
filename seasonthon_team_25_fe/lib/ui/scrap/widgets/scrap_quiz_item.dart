import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/models/scrap_models.dart';

class ScrapQuizItemWidget extends ConsumerWidget {
  final ScrapQuizItem quizItem;
  final VoidCallback? onTap;

  const ScrapQuizItemWidget({
    super.key,
    required this.quizItem,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCorrect = quizItem.isCorrectAtScrap;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 문제 텍스트 영역
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 문제 텍스트
                Text(
                  quizItem.question,
                  style: AppTypography.m600.copyWith(
                    color: AppColors.bk,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                
                const SizedBox(height: 4),
                
                // 퀴즈 날짜와 카테고리
                Row(
                  children: [
                    Text(
                      quizItem.quizDate,
                      style: AppTypography.s400.copyWith(
                        color: AppColors.gr600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '•',
                      style: AppTypography.s400.copyWith(
                        color: AppColors.gr600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      quizItem.category.toUpperCase(),
                      style: AppTypography.s400.copyWith(
                        color: AppColors.gr600,
                      ),
                    ),
                    if (quizItem.quizId != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        '•',
                        style: AppTypography.s400.copyWith(
                          color: AppColors.gr600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'ID: ${quizItem.quizId}',
                        style: AppTypography.s400.copyWith(
                          color: AppColors.gr600,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 12),
          
          // 정답/오답 상태 버튼
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isCorrect ? AppColors.primarySky : AppColors.secondaryRd,
              borderRadius: BorderRadius.circular(AppRadius.chips),
            ),
            child: Text(
              isCorrect ? '정답' : '오답',
              style: AppTypography.s500.copyWith(
                color: AppColors.wt,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
