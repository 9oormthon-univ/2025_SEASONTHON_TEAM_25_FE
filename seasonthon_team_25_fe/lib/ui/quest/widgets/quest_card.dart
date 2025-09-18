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
        child: Row(
          children: [
            // 왼쪽: 퀘스트 정보
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 퀘스트 제목 + 시간 표시 (미달성일 때)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          quest.title,
                          style: AppTypography.h3.copyWith(color: AppColors.bk),
                        ),
                      ),
                      if (!isCompleted)
                        Text(
                          '3일 2시간 30분 남음',
                          style: AppTypography.s400.copyWith(
                            color: AppColors.secondaryRd,
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
                      // 진행도 바
                      Container(
                        height: 16,
                        decoration: BoxDecoration(
                          color: isCompleted
                              ? AppColors.primarySky
                              : AppColors.wt,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: isCompleted
                                ? AppColors.primarySky
                                : AppColors.gr200,
                            width: 1,
                          ),
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
                                      : AppColors.secondaryRd,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                            // 진행도 숫자 중앙에 표시
                            Center(
                              child: Text(
                                '${quest.progressCount}/${quest.requirementCount}',
                                style: AppTypography.s500.copyWith(
                                  color: isCompleted
                                      ? Colors.white
                                      : progress > 0.3  // 진행률이 30% 이상이면 흰색, 아니면 빨간색
                                          ? Colors.white
                                          : AppColors.secondaryRd,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // 오른쪽: 통합된 보상 버튼 (동전 + 텍스트)
            _buildIntegratedRewardButton(isCompleted, isClaimingReward),
          ],
        ),
      ),
    );
  }

  Widget _buildIntegratedRewardButton(bool isCompleted, bool isClaimingReward) {
    if (quest.claimed) {
      // 이미 수령
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.gr200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.home.coin.image(
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 4),
            Text(
              '수령 완료',
              style: AppTypography.s400.copyWith(color: AppColors.gr600),
            ),
          ],
        ),
      );
    }

    if (!isCompleted) {
      // 진행 중 (비활성화된 상태)
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.gr200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.home.coin.image(
              width: 30,
              height: 30,
              fit: BoxFit.contain,
              color: AppColors.gr400,
            ),
            const SizedBox(height: 4),
            Text(
              '보상 받기',
              style: AppTypography.s400.copyWith(color: AppColors.gr400),
            ),
          ],
        ),
      );
    }

    // 완료 → 수령 가능 (활성화된 상태)
    return GestureDetector(
      onTap: isClaimingReward ? null : onClaimReward,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: isClaimingReward ? AppColors.gr400 : AppColors.primarySky,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isClaimingReward)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.wt,
                ),
              )
            else
              Assets.images.home.coin.image(
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            const SizedBox(height: 4),
            Text(
              isClaimingReward ? '수령 중...' : '보상 받기',
              style: AppTypography.s400.copyWith(
                color: AppColors.wt,
                fontWeight: FontWeight.w500,
              ),
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.gr200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '수령 완료',
          style: AppTypography.s400.copyWith(color: AppColors.gr600),
        ),
      );
    }

    if (!isCompleted) {
      // 진행 중 (비활성화된 상태)
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.gr100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '보상 받기',
          style: AppTypography.s400.copyWith(color: AppColors.gr400),
        ),
      );
    }

    // 완료 → 수령 가능 (활성화된 상태)
    return GestureDetector(
      onTap: isClaimingReward ? null : onClaimReward,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isClaimingReward ? AppColors.gr400 : AppColors.primarySky,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isClaimingReward) ...[
              SizedBox(
                width: 10,
                height: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: AppColors.wt,
                ),
              ),
              const SizedBox(width: 6),
            ],
            Text(
              isClaimingReward ? '수령 중...' : '보상 받기',
              style: AppTypography.s400.copyWith(
                color: AppColors.wt,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
