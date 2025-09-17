import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/models/achievement_models.dart';
import 'package:seasonthon_team_25_fe/ui/components/img/html_image.dart';

class AchievementCard extends StatelessWidget {
  final AchievementItem achievement;
  final VoidCallback? onTap;

  const AchievementCard({
    super.key,
    required this.achievement,
    this.onTap,
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
                child: achievement.iconUrl.isNotEmpty
                    ? HtmlImage(
                        url: achievement.iconUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        isClaimed ? Icons.emoji_events : Icons.help_outline,
                        color: isClaimed ? AppColors.wt : AppColors.gr400,
                        size: 24,
                      ),
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            
            const SizedBox(height: 4),
            
            // 업적 설명
            Text(
              achievement.description,
              style: AppTypography.s400.copyWith(
                color: AppColors.gr600,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            
            const SizedBox(height: 8),
            
            // 상태 표시
            if (isClaimed) ...[
              Container(
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
              ),
            ] else ...[
              Container(
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
              ),
            ],
          ],
        ),
      ),
      ),
    );
  }
}
