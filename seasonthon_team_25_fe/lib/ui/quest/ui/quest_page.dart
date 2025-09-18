import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/coin_controller.dart';
import 'package:seasonthon_team_25_fe/feature/quest/presentation/provider/quest_controller.dart';
import 'package:seasonthon_team_25_fe/feature/wallet/presentation/provider/wallet_controller.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';
import 'package:seasonthon_team_25_fe/ui/quest/widgets/quest_card.dart';

class QuestPage extends ConsumerStatefulWidget {
  const QuestPage({super.key});

  @override
  ConsumerState<QuestPage> createState() => _QuestPageState();
}

class _QuestPageState extends ConsumerState<QuestPage> {
  @override
  void initState() {
    super.initState();
    // 페이지 로드 시 퀘스트 목록과 잔액 조회
    Future.microtask(() {
      ref.read(questControllerProvider.notifier).loadCurrentQuests();
      ref.read(walletControllerProvider.notifier).fetchBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    final questState = ref.watch(questControllerProvider);
    final balanceState = ref.watch(walletControllerProvider);
    final isLoading = questState.isLoading;
    final error = questState.error;
    final quests = questState.quests;

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '퀘스트',
        showLeftBtn: true,
        showRightBtn: false,
        onTapLeftBtn: () => context.go("/home"),
      ),
      body: Column(
        children: [
          // 코인 잔액 표시
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: balanceState.when(
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
                data: (data) => CoinBalanceChip(
                  balance: data.balance,
                  backgroundColor: AppColors.sk_25,
                  textColor: AppColors.primarySky,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // 퀘스트 목록
          Expanded(child: _buildQuestList(isLoading, error, quests)),
        ],
      ),
    );
  }

  Widget _buildQuestList(bool isLoading, String? error, List quests) {
    if (error != null) {
      return _buildErrorState(error);
    }

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (quests.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(questControllerProvider.notifier).loadCurrentQuests();
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: quests.length,
        itemBuilder: (context, index) {
          final quest = quests[index];
          return QuestCard(
            quest: quest,
            onClaimReward: () async {
              final response = await ref
                  .read(questControllerProvider.notifier)
                  .claimQuestReward(quest.userQuestId);

              if (response != null && mounted) {
                // 보상 수령 결과에 따른 메시지 표시
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(response.message),
                    backgroundColor: response.completed
                        ? AppColors.primarySky
                        : AppColors.secondaryRd,
                  ),
                );

                // 성공한 경우 잔액 새로고침
                if (response.completed) {
                  ref.read(coinProvider.notifier).loadBalance();
                }
              } else if (mounted) {
                // 에러 처리
                final error = ref.read(questControllerProvider).error;
                if (error != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error), backgroundColor: Colors.red),
                  );
                }
              }
            },
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
              '퀘스트를 불러올 수 없습니다',
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(questControllerProvider.notifier)
                      .loadCurrentQuests();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primarySky,
                  foregroundColor: AppColors.wt,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('다시 시도', style: AppTypography.h3),
              ),
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
              '이번 주 퀘스트가 준비 중입니다',
              style: AppTypography.h3.copyWith(color: AppColors.gr600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '곧 새로운 퀘스트가 업데이트됩니다!\n출석, 뉴스 읽기, 퀴즈 풀기 등\n다양한 활동으로 보상을 받아보세요.',
              style: AppTypography.m400.copyWith(color: AppColors.gr600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(questControllerProvider.notifier)
                      .loadCurrentQuests();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primarySky,
                  foregroundColor: AppColors.wt,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('새로고침', style: AppTypography.h3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
