import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/quest/data/models/quest_models.dart';
import 'package:seasonthon_team_25_fe/feature/quest/presentation/provider/quest_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class QuestCard extends ConsumerWidget {
  final QuestItem quest;
  final VoidCallback? onClaimReward;

  const QuestCard({super.key, required this.quest, this.onClaimReward});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questState = ref.watch(questControllerProvider);
    final isClaimingReward =
        questState.isClaimingReward ||
        questState.claimingQuestIds.contains(quest.userQuestId);

    // 진행도 계산
    final progress = quest.requirementCount > 0
        ? (quest.progressCount / quest.requirementCount).clamp(0.0, 1.0)
        : 0.0;

    // 완료 여부
    final isCompleted =
        quest.completed ||
        (quest.currentStreak >= quest.requirementCount &&
            quest.requirementCount > 0);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.wt,
        borderRadius: BorderRadius.circular(AppRadius.chips),
        boxShadow: AppShadows.dsDefault,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 퀘스트 제목 + 코인 아이콘
            Row(
              children: [
                Expanded(
                  child: Text(
                    quest.title,
                    style: AppTypography.h3.copyWith(color: AppColors.bk),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryIv,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    Assets.images.home.coin.path,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // 퀘스트 설명
            Text(
              quest.description,
              style: AppTypography.m500.copyWith(color: AppColors.primarySky),
            ),

            const SizedBox(height: 16),

            // 진행도 바
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 진행도 숫자 + 완료 텍스트
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${quest.progressCount}/${quest.requirementCount}',
                      style: AppTypography.m600.copyWith(color: AppColors.bk),
                    ),
                    if (isCompleted && !quest.claimed)
                      Text(
                        '완료!',
                        style: AppTypography.m600.copyWith(
                          color: AppColors.primarySky,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),

                // 테두리 있는 진행도 바
                Container(
                  height: 12,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isCompleted
                          ? AppColors.primarySky
                          : AppColors.gr200,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Stack(
                    children: [
                      FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: progress,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isCompleted
                                ? AppColors.primarySky
                                : AppColors.primarySky.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 보상 버튼
            Align(
              alignment: Alignment.centerRight,
              child: _buildRewardButton(isCompleted, isClaimingReward),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardButton(bool isCompleted, bool isClaimingReward) {
    if (quest.claimed) {
      // 이미 수령
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.gr200,
          borderRadius: BorderRadius.circular(AppRadius.chips),
        ),
        child: Text(
          '수령 완료',
          style: AppTypography.m500.copyWith(color: AppColors.gr600),
        ),
      );
    }

    if (!isCompleted) {
      // 진행 중
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.gr100,
          borderRadius: BorderRadius.circular(AppRadius.chips),
        ),
        child: Text(
          '진행 중',
          style: AppTypography.m500.copyWith(color: AppColors.gr600),
        ),
      );
    }

    // 완료 → 수령 가능
    return GestureDetector(
      onTap: isClaimingReward ? null : onClaimReward,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isClaimingReward ? AppColors.gr400 : AppColors.primarySky,
          borderRadius: BorderRadius.circular(AppRadius.chips),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isClaimingReward) ...[
              SizedBox(
                width: 12,
                height: 12,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.wt,
                ),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              isClaimingReward ? '수령 중...' : '보상 받기',
              style: AppTypography.m500.copyWith(color: AppColors.wt),
            ),
          ],
        ),
      ),
    );
  }
}
