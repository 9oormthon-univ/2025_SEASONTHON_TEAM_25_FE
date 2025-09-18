import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/models/achievement_models.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
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
        ),
        child: Stack(
          children: [
            // 기본 업적 카드 (확인된 업적만 보임)
            if (isClaimed)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 업적 아이콘 (둥근 사각형 형태)
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: AppColors.primarySky,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: _buildAchievementIcon(),
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // 업적 제목
                    Text(
                      achievement.title,
                      style: AppTypography.s500.copyWith(
                        color: AppColors.primarySky,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 4),
                    
                    // 업적 설명
                    Expanded(
                      child: Text(
                        achievement.description,
                        style: AppTypography.s400.copyWith(
                          color: AppColors.gr600,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            
            // 달성했지만 미확인 업적: 빨간 배경의 둥근 사각형 (두 번째 이미지와 동일)
            if (isFromApi && !isClaimed)
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4444), // 빨간 배경
                  borderRadius: BorderRadius.circular(16), // 둥근 사각형
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // "업적 달성!" 텍스트 (동전 위)
                      Text(
                        '업적 달성!',
                        style: AppTypography.s500.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // 홈화면 동전 이미지 사용 (더 작게)
                      Assets.images.home.coin.image(
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // "클릭하여 확인" 텍스트 (동전 아래)
                      Text(
                        '클릭하여 확인',
                        style: AppTypography.s400.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            
            // 미달성 업적
            if (!isFromApi)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 업적 아이콘 (물음표 둥근 사각형 더 크게)
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: AppColors.gr200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _buildAchievementIcon(),
                    ),
                    
                    const SizedBox(height: 14),
                    
                    // 업적 제목
                    Text(
                      achievement.title,
                      style: AppTypography.s500.copyWith(
                        color: AppColors.gr600,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // 업적 설명
                    Expanded(
                      child: Text(
                        '???',
                        style: AppTypography.s400.copyWith(
                          color: AppColors.gr600,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
          ],
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
      // 미달성 업적은 상태 표시 없음 (빈 공간)
      return const SizedBox.shrink();
    }
  }

  Widget _buildAchievementIcon() {
    if (achievement.claimed) {
      // 확인된 업적: 실제 이미지 표시 (둥근 사각형 형태)
      return ProxyImage(
        url: achievement.iconUrl,
        width: 65,
        height: 65,
        fit: BoxFit.cover,
        placeholder: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: AppColors.gr200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primarySky,
            ),
          ),
        ),
        errorWidget: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: AppColors.gr200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.emoji_events,
            color: AppColors.primarySky,
            size: 28,
          ),
        ),
      );
    } else if (isFromApi) {
      // 달성했지만 미확인 업적: 이미지처럼 빨간 배경에 금색 동전과 텍스트
      return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFFF4444), // 진한 빨간색
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 금색 동전 (3D 효과)
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700), // 금색
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFD700).withOpacity(0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'F',
                  style: TextStyle(
                    color: Color(0xFFB8860B), // 어두운 금색
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            // 텍스트
            const Text(
              '업적 달성!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '클릭하여 확인',
              style: TextStyle(
                color: Colors.white,
                fontSize: 6,
              ),
            ),
          ],
        ),
      );
    } else {
      // 미달성 업적: 깔끔한 물음표 아이콘 (둥근 사각형, 더 크게)
      return Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5), // 연한 회색
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE0E0E0), // 연한 테두리
            width: 1,
          ),
        ),
        child: const Center(
          child: Text(
            '?',
            style: TextStyle(
              color: Color(0xFF9E9E9E), // 회색
              fontSize: 36,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );
    }
  }
}
