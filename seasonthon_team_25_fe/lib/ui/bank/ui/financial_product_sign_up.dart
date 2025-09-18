// 금융 상품 가입
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/coin_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';

class FinancialProductSignUpPage extends ConsumerStatefulWidget {
  final String productId;
  const FinancialProductSignUpPage({super.key, required this.productId});

  @override
  ConsumerState<FinancialProductSignUpPage> createState() =>
      _FinancialProductSignUpPageState();
}

// class FinancialProductSignUpPage extends ConsumerStatefulWidget {
//   final int productId;
//   final int? termMonths;
//   final int? maxLimit;
//   final String? productName;

//   const FinancialProductSignUpPage({
//     super.key,
//     required this.productId,
//     this.termMonths,
//     this.maxLimit,
//     this.productName,
//   });

//   @override
//   ConsumerState<FinancialProductSignUpPage> createState() =>
//       _FinancialProductSignUpPageState();
// }

class _FinancialProductSignUpPageState
    extends ConsumerState<FinancialProductSignUpPage> {
  //final String reward = "1,234원";
  //int? balance;
  //final String productName = "청년 희망 적금";
  //final int count = 5;
  //final String max = "100,000";

  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(coinProvider.notifier).loadBalance();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final balance = ref.watch(
      coinProvider.select((state) => state.asData?.value ?? 0),
    );

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '금융 상품 가입하기',
        showLeftBtn: true,
        showRightBtn: true,
        onTapLeftBtn: () {
          context.pop();
        },
        onTapRightBtn: () {
          context.go("/bank");
        },
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(20, 23, 20, 35),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CoinBalanceChip(
                  balance: balance.toInt(),
                  backgroundColor: AppColors.sk_25,
                  textColor: AppColors.primarySky,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.wt,
                  borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
                  boxShadow: AppShadows.dsDefault,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "적금 이름",
                      style: AppTypography.h3.copyWith(
                        color: AppColors.primarySky,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            "기간 선택",
                            style: AppTypography.h3.copyWith(
                              color: AppColors.primarySky,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 11,
                              vertical: 9.5,
                            ),
                            child: SvgPicture.asset(
                              Assets.images.bank.primaryToggleBtn.path,
                              height: 5,
                              width: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              const Divider(color: AppColors.gr200, thickness: 1),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.topLeft,
                child: Text("회당 얼마를 입금할까요?", style: AppTypography.h2),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "해당 상품의 1회 최대 납입 금액은 N,NNNN,NNN원이에요",
                  style: AppTypography.m400.copyWith(color: AppColors.gr600),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "1회당",
                  style: AppTypography.m600.copyWith(
                    color: AppColors.secondaryBl,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(minHeight: 48),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.sk_25,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.bottomSheet,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppRadius.bottomSheet,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    errorStyle: AppTypography.m500.copyWith(
                      color: AppColors.secondaryRd,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '금액을 입력해 주세요';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Divider(color: AppColors.gr200, thickness: 1),
              const SizedBox(height: 50),
              const Spacer(),
              PrimaryFilledButton(
                label: "가입하기",
                onPressed: () {
                  context.go("/bank/complete");
                },
                customWidth: double.infinity,
              ),

              // 가입하기 버튼
              // PrimaryActionButton(
              //   isLoading: false,
              //   label: "가입하기",
              //   onPressed: () async {
              //     if (!_formKey.currentState!.validate()) return;

              //     final amount = int.tryParse(_textController.text) ?? 0;
              //     if (amount <= 0) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(content: Text('1회 납입 금액을 올바르게 입력해 주세요')),
              //       );
              //       return;
              //     }
              //     if (widget.termMonths == null) {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(content: Text('기간 선택 정보가 없습니다')),
              //       );
              //       return;
              //     }

              //     try {
              //       final repo = ref.read(productRegisterRepositoryProvider);
              //       // TODO: reserveType은 실제 UI 선택값과 매핑하세요. 임시로 정액식 "S"
              //       final result = await repo.registerSaving(
              //         productSnapshotId: widget.productId,
              //         termMonths: widget.termMonths!, // 상세 옵션과 동일해야 함
              //         reserveType: "", // 또는 "F"/"FREE"/"FIXED"
              //         autoDebitAmount: amount,
              //       );

              //       if (!mounted) return;

              //       context.go(
              //         "/bank/sign-up-complete",
              //         extra: SignUpCompleteArgs(
              //           maturityDate: result.maturityDate,
              //           autoDebitAmount: amount,
              //           termMonths: widget.termMonths!,
              //         ),
              //       );
              //     } catch (e) {
              //       debugPrint("가입 실패: $e");
              //       if (mounted) {
              //         ScaffoldMessenger.of(
              //           context,
              //         ).showSnackBar(SnackBar(content: Text("가입에 실패했습니다: $e")));
              //       }
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
