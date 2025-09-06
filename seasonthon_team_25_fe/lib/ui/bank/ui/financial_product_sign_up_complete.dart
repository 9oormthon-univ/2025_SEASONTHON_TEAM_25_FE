// 금융 상품 가입 완료
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';

class FinancialProductSignUpCompletePage extends ConsumerStatefulWidget {
  const FinancialProductSignUpCompletePage({super.key});

  @override
  ConsumerState<FinancialProductSignUpCompletePage> createState() => _FinancialProductSignUpCompletePageState();
}

class _FinancialProductSignUpCompletePageState extends ConsumerState<FinancialProductSignUpCompletePage> {
  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '가입 완료', showLeft: false, showRight: true),
      body: const Center(child: Text('구현 예정')),
    );
  }
}