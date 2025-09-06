// 금융 상품 상세 보기

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';

class FinancialProductDetailPage extends ConsumerStatefulWidget {
  const FinancialProductDetailPage({super.key});

  @override
  ConsumerState<FinancialProductDetailPage> createState() => _FinancialProductDetailPageState();
}

class _FinancialProductDetailPageState extends ConsumerState<FinancialProductDetailPage> {
  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '금융 상품 상세 보기', showLeft: true, showRight: true),
      body: const Center(child: Text('구현 예정')),
    );
  }
}