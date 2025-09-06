// 금융 상품 가입
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';
import 'package:seasonthon_team_25_fe/ui/components/reward_box.dart';

class FinancialProductSignUpPage extends ConsumerStatefulWidget {
  const FinancialProductSignUpPage({super.key});

  @override
  ConsumerState<FinancialProductSignUpPage> createState() =>
      _FinancialProductSignUpPageState();
}

class _FinancialProductSignUpPageState
    extends ConsumerState<FinancialProductSignUpPage> {
  //final String reward = "1,234원";
  int? balance;
  final String productName = "청년 희망 적금";
  final int count = 5;
  final String max = "100,000";

  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

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
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '금융 상품 가입하기',
        showLeft: true,
        showRight: false,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 35),
        child: Form(
          key: _formKey,
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "총 $count회자",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 1.0),
                    bottom: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('회당 얼마를 입금할까요?', style: AppTypography.h2),
                    Text(
                      '해당 상품의 1회 최대 납입 금액은 $max원이에요',
                      style: AppTypography.l500,
                    ),
                    const SizedBox(height: 16),
                    Text('1회당', style: AppTypography.m600),
                    // 금액 입력 필드
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: TextFormField(
                        controller: _textController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.sk.withValues(alpha: .25),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '1회 납입 금액을 입력해 주세요';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // 가입하기 버튼
              PrimaryActionButton(
                isLoading: false,
                label: "가입하기",
                onPressed: () {
                  context.go("/bank/sign-up-complete");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
