import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/bank_filter_bottom_sheet.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/sort_bottom_sheet.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';
import 'package:seasonthon_team_25_fe/ui/components/tab_bar/custom_tab_bar.dart';

import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/coin_controller.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/presentation/provider/savings_product_controller.dart';

class FinancialProductListPage extends ConsumerStatefulWidget {
  const FinancialProductListPage({super.key});

  @override
  ConsumerState<FinancialProductListPage> createState() =>
      _FinancialProductListPageState();
}

class _FinancialProductListPageState
    extends ConsumerState<FinancialProductListPage> {
  int _tabIndex = 1; // 0: 예금, 1: 적금
  String _sort = "name"; // 기본 정렬
  String? _banks; // 선택 은행

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(coinProvider.notifier).loadBalance();
      ref
          .read(savingsProductControllerProvider.notifier)
          .load(sort: _sort, banks: _banks);
    });
  }

  void _reloadProducts() {
    ref
        .read(savingsProductControllerProvider.notifier)
        .load(sort: _sort, banks: _banks);
  }

  @override
  Widget build(BuildContext context) {
    final balance = ref.watch(
      coinProvider.select((state) => state.asData?.value ?? 0),
    );
    final productsState = ref.watch(savingsProductControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '금융 상품 보기',
        showLeftBtn: true,
        showRightBtn: false,
        onTapLeftBtn: () => context.go('/bank'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 23, 20, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CoinBalanceChip(
                balance: balance,
                backgroundColor: AppColors.sk_25,
                textColor: AppColors.primarySky,
              ),
            ),
            const SizedBox(height: 20),
            CustomTabBar(
              labels: const ['예금', '적금'],
              selectedIndex: _tabIndex,
              onChanged: (i) => setState(() => _tabIndex = i),
            ),
            const SizedBox(height: 18),

            // 🔹 정렬/은행 선택 영역
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 정렬 버튼
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => SortBottomSheet(
                        initial: _sort,
                        onApply: (selected) {
                          setState(() {
                            _sort = selected == "기본순" ? "name" : "popular";
                          });
                          _reloadProducts();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.images.bank.settingIcon.path,
                        height: 18,
                        width: 18,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        _sort == "name" ? "기본순" : "인기순",
                        style: AppTypography.m600.copyWith(
                          color: AppColors.gr600,
                        ),
                      ),
                    ],
                  ),
                ),

                // 은행 버튼
                GestureDetector(
                  onTap: () {
                    final banks = productsState.asData?.value.bankNames ?? [];
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => BankFilterBottomSheet(
                        banks: ["전체 은행", ...banks],
                        initial: _banks,
                        onApply: (selected) {
                          setState(() {
                            _banks = selected == "전체 은행" ? null : selected;
                          });
                          _reloadProducts();
                        },
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        _banks ?? "전체 은행",
                        style: AppTypography.m600.copyWith(
                          color: AppColors.gr600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 9.5,
                          horizontal: 7,
                        ),
                        child: SvgPicture.asset(
                          Assets.images.bank.toggleBtn.path,
                          height: 5,
                          width: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(color: AppColors.gr200, thickness: 1),

            // 🔹 리스트 영역
            Expanded(
              child: IndexedStack(
                index: _tabIndex,
                children: [
                  // --- [탭 1] 예금 (추후 구현) ---
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Assets.images.characters.faffLove.image(
                          width: 209,
                          height: 256,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          "곧 업데이트 될 예정입니다!\n업그레이드 될 파프 지켜봐 주실거죠?",
                          style: AppTypography.l400.copyWith(
                            color: AppColors.secondarySk,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  // --- [탭 2] 적금 상품 리스트 ---
                  productsState.when(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (err, st) => Center(child: Text("에러: $err")),
                    data: (data) {
                      final products = data.content;
                      if (products.isEmpty) {
                        return const Center(child: Text("상품이 없습니다."));
                      }
                      return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, i) {
                          final p = products[i];
                          return ListTile(
                            title: Text(p.productName),
                            subtitle: Text(p.bankName),
                            trailing: Text(p.aiSummary),
                            onTap: () {
                              context.go('/bank/detail/${p.productSnapshotId}');
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
