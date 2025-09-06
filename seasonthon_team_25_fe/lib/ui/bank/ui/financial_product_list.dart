// 금융 상품 보기
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/financial_list_item.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
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

  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
    _loadBalance();
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

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> mockFinancialProducts = [
      {"title": "청년 희망 적금", "subtitle": "연 5% 금리, 2년 만기"},
      {"title": "주택 청약 저축", "subtitle": "내 집 마련 필수"},
      {"title": "단기 채권 펀드", "subtitle": "안정적인 단기 수익"},
      {"title": "연금 저축 보험", "subtitle": "노후 대비 장기 저축"},
      {"title": "고배당 주식 펀드", "subtitle": "분기별 배당 지급"},
    ];

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(title: '금융 상품 보기', showLeft: true, showRight: false),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: RewardBox(
              text: balance?.toString() ?? '-원',
              textColor: AppColors.primary,
              backgroundColor: AppColors.sk.withValues(alpha: .25),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    labelColor: AppColors.primary,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: AppColors.primary,
                    tabs: const [Tab(text: '예금'), Tab(text: '적금')],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(child: Text('예금 상품 목록')),
                        ListView.builder(
                          itemCount: mockFinancialProducts.length,
                          itemBuilder: (context, index) {
                            final product = mockFinancialProducts[index];
                            return FinancialListItem(
                              title: product["title"]!,
                              subtitle: product["subtitle"]!,
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${product["title"]} 가입하기"),
                                  ),
                                );
                                context.go("/bank/detail");
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
          ),
        ],
      ),
    );
  }
}
