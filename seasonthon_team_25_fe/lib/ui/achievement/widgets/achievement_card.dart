import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/models/achievement_models.dart';
import 'package:seasonthon_team_25_fe/ui/components/img/proxy_image.dart';

class AchievementCard extends StatelessWidget {
  final AchievementItem achievement;
  final VoidCallback? onTap;
  final bool isFromApi;

  const AchievementCard({
    super.key,
    required this.achievement,
    this.onTap,
    this.isFromApi = false,
  });

  @override
  Widget build(BuildContext context) {
    final isClaimed = achievement.claimed;

    return GestureDetector(
      onTap: !isClaimed && onTap != null ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.wt,
          borderRadius: BorderRadius.circular(AppRadius.chips),
          boxShadow: AppShadows.dsDefault,
          border: isClaimed
              ? Border.all(color: AppColors.primarySky, width: 2)
              : Border.all(color: AppColors.gr200, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 업적 아이콘
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: isClaimed ? AppColors.primarySky : AppColors.gr200,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: _buildAchievementIcon(),
                ),
              ),
              
              const SizedBox(height: 8),
              
              // 업적 제목
              Text(
                achievement.title,
                style: AppTypography.s500.copyWith(
                  color: isClaimed ? AppColors.primarySky : AppColors.gr600,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: 4),
              
              // 업적 설명
              Expanded(
                child: Text(
                  _getDescription(),
                  style: AppTypography.s400.copyWith(
                    color: AppColors.gr600,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              
              const SizedBox(height: 8),
              
              // 상태 표시
              _buildStatusIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  String _getDescription() {
    if (achievement.claimed) {
      return achievement.description;
    } else if (isFromApi) {
      return '업적 달성! (클릭하여 확인)';
    } else {
      return '???';
    }
  }

  Widget _buildStatusIndicator() {
    if (achievement.claimed) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.primarySky,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '달성',
          style: AppTypography.s500.copyWith(
            color: AppColors.wt,
          ),
        ),
      );
    } else if (isFromApi) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.secondaryRd,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '클릭하여 확인',
          style: AppTypography.s500.copyWith(
            color: AppColors.wt,
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.gr200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '미달성',
          style: AppTypography.s500.copyWith(
            color: AppColors.gr600,
          ),
        ),
      );
    }
  }

  Widget _buildAchievementIcon() {
    if (achievement.claimed) {
      // 확인된 업적: 실제 이미지 표시
      return ProxyImage(
        url: achievement.iconUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        placeholder: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.gr200,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primarySky,
            ),
          ),
        ),
        errorWidget: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.gr200,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.emoji_events,
            color: AppColors.primarySky,
            size: 24,
          ),
        ),
      );
    } else {
      // 미확인 업적: 물음표 아이콘 표시
      return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.gr200,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.help_outline,
          color: AppColors.gr400,
          size: 24,
        ),
      );
    }
  }
}
