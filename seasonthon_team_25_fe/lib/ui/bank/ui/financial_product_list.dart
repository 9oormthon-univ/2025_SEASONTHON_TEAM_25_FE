// 금융 상품 보기
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/feature/bank/repository/product_summary.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/financial_list_item.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/reward_box.dart';

class FinancialProductListPage extends ConsumerStatefulWidget {
  const FinancialProductListPage({super.key});

  @override
  ConsumerState<FinancialProductListPage> createState() =>
      _FinancialProductListPageState();
}

class _FinancialProductListPageState
    extends ConsumerState<FinancialProductListPage> {
  //final String reward = "1,234원";
  int? balance;
  late Future<List<ProductSummary>> _future;

  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
    _loadBalance();
    _future = _load(); // 최초 로드
  }

  Future<void> _loadBalance() async {
    try {
      final dio = ref.read(dioProvider);
      final res = await dio.get('/api/wallet/balance');
      setState(() {
        balance = res.data['balance'] as int;
        debugPrint('잔액 조회 성공: $balance');
        //isLoadingBalance = false;
      });
    } catch (e) {
      debugPrint('잔액 조회 실패: $e');
      //setState(() => isLoadingBalance = false);
    }
  }

  Future<List<ProductSummary>> _load() {
    final repo = ref.read(productRepositoryProvider);
    return repo.fetchProducts(type: 'SAVING', sort: 'popular');
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, String>> mockFinancialProducts = [
    //   {"title": "청년 희망 적금", "subtitle": "연 5% 금리, 2년 만기"},
    //   {"title": "주택 청약 저축", "subtitle": "내 집 마련 필수"},
    //   {"title": "단기 채권 펀드", "subtitle": "안정적인 단기 수익"},
    //   {"title": "연금 저축 보험", "subtitle": "노후 대비 장기 저축"},
    //   {"title": "고배당 주식 펀드", "subtitle": "분기별 배당 지급"},
    // ];

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '금융 상품 보기',
        showLeftBtn: true,
        showRightBtn: false,
        onTapLeftBtn: () {
          context.go('/bank');
        },
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: RewardBox(
              text: "${balance?.toString() ?? '-'}원",
              textColor: AppColors.primarySky,
              backgroundColor: AppColors.secondarySk.withValues(alpha: .25),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: AppColors.primarySky,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: AppColors.primarySky,
                    tabs: const [Tab(text: '적금'), Tab(text: '예금')], //예금
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        FutureBuilder<List<ProductSummary>>(
                          future: _future,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasError) {
                              return Center(
                                child: Text('불러오기 실패: ${snapshot.error}'),
                              );
                            }

                            final items = snapshot.data ?? [];
                            if (items.isEmpty) {
                              return const Center(child: Text('상품이 없어요'));
                            }

                            return ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final product = items[index];
                                return FinancialListItem(
                                  title: product.productName,
                                  subtitle:
                                      '${product.bankName} · ${product.aiSummary}',
                                  onPressed: () {
                                    context.go(
                                      "/bank/detail/${product.productSnapshotId}",
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                        const Center(child: Text('예금 상품 목록')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
