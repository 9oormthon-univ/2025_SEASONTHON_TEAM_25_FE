import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
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
          // 코인 잔액 표시
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                coinState.when(
                  loading: () => CoinBalanceChip(
                    balance: 0,
                    backgroundColor: AppColors.sk_25,
                    textColor: AppColors.primarySky,
                  ),
                  error: (_, __) => CoinBalanceChip(
                    balance: 0,
                    backgroundColor: AppColors.sk_25,
                    textColor: AppColors.primarySky,
                  ),
                  data: (balance) => CoinBalanceChip(
                    balance: balance,
                    backgroundColor: AppColors.sk_25,
                    textColor: AppColors.primarySky,
                  ),
                ),
                const Spacer(),
                // 달성한 업적 개수 표시
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primarySky,
                    borderRadius: BorderRadius.circular(20),
                  ),
                child: Text(
                  '달성한 업적 ${achievements.where((a) => a.claimed).length}개',
                  style: AppTypography.m500.copyWith(color: AppColors.wt),
                ),
                ),
              ],
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

    if (achievements.isEmpty) {
      return _buildEmptyState();
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
          childAspectRatio: 0.8,
        ),
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          final achievement = achievements[index];
          return AchievementCard(
            achievement: achievement,
            onTap: () => _handleAchievementTap(achievement),
          );
        },
      ),
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
