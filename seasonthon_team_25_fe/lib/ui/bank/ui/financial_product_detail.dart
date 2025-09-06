// 금융 상품 상세 보기

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';
import 'package:seasonthon_team_25_fe/ui/components/reward_box.dart';

class FinancialProductDetailPage extends ConsumerStatefulWidget {
  const FinancialProductDetailPage({super.key});

  @override
  ConsumerState<FinancialProductDetailPage> createState() =>
      _FinancialProductDetailPageState();
}

class _FinancialProductDetailPageState
    extends ConsumerState<FinancialProductDetailPage> {
  //final String reward = "1,234원";
  int? balance;
  final String productName = "청년 희망 적금";
  final int count = 5;

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
    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '금융 상품 상세 보기',
        showLeft: true,
        showRight: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 35),
        child: Column(
          spacing: 16,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: RewardBox(
                text: balance?.toString() ?? '-원',
                textColor: AppColors.primary,
                backgroundColor: AppColors.sk.withValues(alpha: .25),
              ),
            ),
            BlurredCard(
              height: 48,
              child: Row(
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "총 $count회자",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 1.0),
                    bottom: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                child: Text(" 상품 상세 정보 영역 "),
              ),
            ),
            // 가입하기 버튼
            PrimaryActionButton(isLoading: false, label: "가입하기", onPressed: () {
              context.go("/bank/sign-up");
            })
          ],
        ),
      ),
    );
  }
}
