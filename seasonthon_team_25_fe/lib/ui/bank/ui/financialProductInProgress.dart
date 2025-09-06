// 진행 중인 금융 상품
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';

class FinancialProductInProgressPage extends ConsumerStatefulWidget {
  const FinancialProductInProgressPage({super.key});

  @override
  ConsumerState<FinancialProductInProgressPage> createState() => _FinancialProductInProgressPageState();
}

class _FinancialProductInProgressPageState extends ConsumerState<FinancialProductInProgressPage> {
  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '진행 중인 금융 상품', showLeft: true, showRight: false),
      body: const Center(child: Text('구현 예정')),
    );
  }
}