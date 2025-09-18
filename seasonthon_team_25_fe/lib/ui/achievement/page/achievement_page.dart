import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/presentation/provider/achievement_controller.dart';
import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/coin_controller.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';
import 'package:seasonthon_team_25_fe/ui/achievement/widgets/achievement_card.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/models/achievement_models.dart';

class AchievementPage extends ConsumerStatefulWidget {
  const AchievementPage({super.key});

  @override
  ConsumerState<AchievementPage> createState() => _AchievementPageState();
}

class _AchievementPageState extends ConsumerState<AchievementPage> {
  @override
  void initState() {
    super.initState();
    // 페이지 로드 시 업적 목록과 잔액 조회
    Future.microtask(() {
      ref.read(achievementControllerProvider.notifier).loadAchievements();
      ref.read(coinProvider.notifier).loadBalance();
    });
  }

  /// 업적 카드 탭 처리
  Future<void> _handleAchievementTap(AchievementItem achievement) async {
    if (achievement.claimed) return;

    final message = await ref
        .read(achievementControllerProvider.notifier)
        .claimAchievement(achievement.achievementId);

    if (mounted && message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.primarySky,
          behavior: SnackBarBehavior.floating,
        ),
      );

      // 코인 잔액 새로고침
      ref.read(coinProvider.notifier).loadBalance();
    }
  }

  @override
  Widget build(BuildContext context) {
    final achievementState = ref.watch(achievementControllerProvider);
    final coinState = ref.watch(coinProvider);
    final isLoading = achievementState.isLoading;
    final error = achievementState.error;
    final achievements = achievementState.achievements;

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: "업적 확인",
        showLeftBtn: true,
        showRightBtn: false,
        onTapLeftBtn: () => context.go("/home"),
      ),
      body: Column(
        children: [
          // 달성한 업적 개수 표시 (출석체크 스타일)
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.wt,
                borderRadius: BorderRadius.circular(AppRadius.chips),
                border: Border.all(color: AppColors.primarySky, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primarySky.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '달성한 업적',
                    style: AppTypography.h3.copyWith(
                      color: AppColors.primarySky,
                    ),
                  ),
                  Text(
                    '${achievements.where((a) => a.claimed).length}개',
                    style: AppTypography.h2.copyWith(
                      color: AppColors.primarySky,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 업적 목록
          Expanded(
            child: _buildAchievementList(isLoading, error, achievements),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementList(bool isLoading, String? error, List achievements) {
    if (error != null) {
      return _buildErrorState(error);
    }

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(achievementControllerProvider.notifier).loadAchievements();
      },
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemCount: 9, // 고정된 9개 업적
        itemBuilder: (context, index) {
          final achievementType = _getAchievementTypeByIndex(index);
          final userAchievement = achievements.firstWhere(
            (a) => a.type == achievementType.value,
            orElse: () => _createDefaultAchievement(achievementType),
          );
          
          // API에서 받아온 업적인지 확인
          final isFromApi = achievements.any((a) => a.type == achievementType.value);
          
          return AchievementCard(
            achievement: userAchievement,
            onTap: isFromApi ? () => _handleAchievementTap(userAchievement) : null,
            isFromApi: isFromApi,
          );
        },
      ),
    );
  }

  AchievementType _getAchievementTypeByIndex(int index) {
    const types = [
      AchievementType.beginnersLuck,    // 초심자의 행운
      AchievementType.moneyMaker,       // 머니 메이커
      AchievementType.newsAddict,       // 속보 중독
      AchievementType.quizCurator,      // 퀴즈 큐레이터
      AchievementType.maturityExpert,   // 만기의 달인
      AchievementType.royalFinancer,    // 로얄 파이낸서
      AchievementType.antiFragile,      // 안티 프레자일
      AchievementType.morningSunshine,  // 아침 햇살
      AchievementType.newsCollector,     // 소식좌
    ];
    return types[index];
  }

  AchievementItem _createDefaultAchievement(AchievementType type) {
    return AchievementItem(
      achievementId: 0,
      type: type.value,
      title: type.title,
      description: type.description,
      iconUrl: '',
      requirementCount: 0,
      claimed: false,
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wifi_off_outlined,
              size: 80,
              color: AppColors.gr400,
            ),
            const SizedBox(height: 24),
            Text(
              '업적을 불러올 수 없습니다',
              style: AppTypography.h3.copyWith(color: AppColors.gr600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '서버 연결에 문제가 있습니다.\n잠시 후 다시 시도해주세요.',
              style: AppTypography.m400.copyWith(color: AppColors.gr600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                ref.read(achievementControllerProvider.notifier).loadAchievements();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primarySky,
                foregroundColor: AppColors.wt,
              ),
              child: const Text('다시 시도'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.emoji_events_outlined,
              size: 80,
              color: AppColors.primarySky,
            ),
            const SizedBox(height: 24),
            Text(
              '업적이 없습니다',
              style: AppTypography.h3.copyWith(color: AppColors.gr600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '다양한 활동을 통해\n업적을 달성해보세요!',
              style: AppTypography.m400.copyWith(color: AppColors.gr600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
