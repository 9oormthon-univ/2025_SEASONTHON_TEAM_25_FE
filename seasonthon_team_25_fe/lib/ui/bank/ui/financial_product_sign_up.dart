// 금융 상품 가입
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';

class FinancialProductSignUpPage extends ConsumerStatefulWidget {
  const FinancialProductSignUpPage({super.key});

  @override
  ConsumerState<FinancialProductSignUpPage> createState() => _FinancialProductSignUpPageState();
}

class _FinancialProductSignUpPageState extends ConsumerState<FinancialProductSignUpPage> {
  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '금융 상품 보기', showLeft: true, showRight: false),
      body: const Center(child: Text('구현 예정')),
    );
  }
}