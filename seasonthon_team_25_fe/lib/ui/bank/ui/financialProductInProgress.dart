import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/feature/bank/repository/subscription.dart';

class FinancialProductInProgressPage extends ConsumerStatefulWidget {
  const FinancialProductInProgressPage({super.key});

  @override
  ConsumerState<FinancialProductInProgressPage> createState() =>
      _FinancialProductInProgressPageState();
}

class _FinancialProductInProgressPageState
    extends ConsumerState<FinancialProductInProgressPage> {
  late Future<List<ActiveSubscription>> _future;
  int? balance;

  @override
  void initState() {
    super.initState();
    _future =
        ref.read(subscriptionRepositoryProvider).fetchActiveSubscriptions();
    _loadBalance();
  }

  Future<void> _loadBalance() async {
    try {
      final dio = ref.read(dioProvider);
      final res = await dio.get('/api/wallet/balance');
      setState(() {
        balance = res.data['balance'] as int;
        debugPrint('잔액 조회 성공: $balance');
      });
    } catch (e) {
      debugPrint('잔액 조회 실패: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '진행 중인 금융 상품',
        showLeft: true,
        showRight: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.sk.withValues(alpha: .25),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "${balance?.toString() ?? '-'}원",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          Expanded(
            child: FutureBuilder<List<ActiveSubscription>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('불러오기 실패: ${snapshot.error}'));
                }

                final items = snapshot.data ?? [];
                if (items.isEmpty) {
                  return const Center(child: Text('진행 중인 상품이 없어요'));
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, i) {
                    final sub = items[i];
                    return BlurredCard(
                      // 높이는 BlurredCard 내부에서 자유롭게 크기 맞게 하기 위해 제거
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              sub.productName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            LinearProgressIndicator(
                              value: sub.progressPercentage / 100,
                              backgroundColor: Colors.grey[200],
                              color: AppColors.primary,
                              minHeight: 8,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            const SizedBox(height: 6),
                            SizedBox(
                              height: 200,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                clipBehavior: Clip.none,
                                children: [
                                  Assets.images.bank.status.image(
                                    width: 90,
                                    height: 110.24,
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                    top: 80,
                                    child: Assets.images.onboarding.faffNocircle
                                        .image(
                                          width: 90,
                                          height: 110.24,
                                          fit: BoxFit.contain,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '현재 금액: ${sub.currentAmount}원 '
                              '(${sub.progressPercentage}%)',
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              '만기일: ${sub.maturityDate} '
                              '(남은 납입 횟수: ${sub.remainingPayments})',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // ✅ 버튼 Row (비율 3:1)
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // 입금하기 로직
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Text(
                                      "입금하기",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  flex: 2,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // 해지하기 로직
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      "해지",
                                      style: AppTypography.xl500.copyWith(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
