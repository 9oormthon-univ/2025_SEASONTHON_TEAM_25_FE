import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/presentation/provider/savings_product_detail_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/detail_card_info.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/edit_btn.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/product_period_bottom_sheet.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/select_deposit_amount_bottom_sheet.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/simulation_card_info.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_white_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/modal/base_modal.dart';

class FinancialProductDetailPage extends ConsumerStatefulWidget {
  final String productId;
  const FinancialProductDetailPage({super.key, required this.productId});

  @override
  ConsumerState<FinancialProductDetailPage> createState() =>
      _FinancialProductDetailPageState();
}

class _FinancialProductDetailPageState
    extends ConsumerState<FinancialProductDetailPage> {
  @override
  void initState() {
    super.initState();
    final productId = int.tryParse(widget.productId);
    if (productId != null) {
      Future.microtask(() {
        ref.read(savingsProductDetailControllerProvider.notifier)
            .loadProductDetail(productId);
      });
    }
  }

  String _formatCurrency(int amount) {
    return "${(amount / 10000).toStringAsFixed(0)}만원";
  }

  String _formatNumber(int number) {
    final formatter = NumberFormat('#,###');
    return "${formatter.format(number)}원";
  }

  String _getInterestRateRange(List<double> rates) {
    if (rates.isEmpty) return "정보 없음";
    final min = rates.reduce((a, b) => a < b ? a : b);
    final max = rates.reduce((a, b) => a > b ? a : b);
    return "연 ${min.toStringAsFixed(2)}%~${max.toStringAsFixed(2)}%";
  }

  String _getPeriodOptions(List<int> periods) {
    if (periods.isEmpty) return "정보 없음";
    return "${periods.join('/')}개월 중 선택";
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(savingsProductDetailControllerProvider);
    final productId = int.tryParse(widget.productId);
    

    if (state.isLoadingDetail) {
      return Scaffold(
        backgroundColor: AppColors.wt,
        body: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: Lottie.asset(
              Assets.lottie.loadingSlow,
              repeat: true,
              animate: true,
              fit: BoxFit.contain,
              frameRate: FrameRate.max,
            ),
          ),
        ),
      );
    }

    if (state.errorMessage != null) {
      return Scaffold(
        backgroundColor: AppColors.wt,
        appBar: CustomWhiteAppBar(
          title: '',
          showLeftBtn: true,
          showRightBtn: false,
          onTapLeftBtn: () => context.pop(),
        ),
        body: Center(
          child: SelectableText.rich(
            TextSpan(
              text: "오류가 발생했습니다: ${state.errorMessage}",
              style: AppTypography.m600.copyWith(color: Colors.red),
            ),
          ),
        ),
      );
    }

    final productDetail = state.productDetail;
    final maturityPreview = state.maturityPreview;

    if (productDetail == null) {
      return Scaffold(
        backgroundColor: AppColors.wt,
        appBar: CustomWhiteAppBar(
          title: '',
          showLeftBtn: true,
          showRightBtn: false,
          onTapLeftBtn: () => context.pop(),
        ),
        body: const Center(
          child: Text("상품 정보를 찾을 수 없습니다."),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.wt,
      appBar: CustomWhiteAppBar(
        title: '',
        showLeftBtn: true,
        showRightBtn: true,
        onTapLeftBtn: () => context.pop(),
        onTapRightBtn: () => context.pop(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 118, 20, 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff2a94ea), Color(0xfffafafa)],
                  stops: [0.1, 0.5],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      productDetail.bankName,
                      style: AppTypography.xl500.copyWith(color: AppColors.wt),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      productDetail.productName,
                      style: AppTypography.h1.copyWith(color: AppColors.wt),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(45, 20, 45, 60),
                    decoration: BoxDecoration(
                      color: AppColors.wt_75,
                      borderRadius: BorderRadius.circular(AppRadius.button),
                      boxShadow: AppShadows.dsDefault,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailCardInfo(
                          label: "금리",
                          value: _getInterestRateRange(productDetail.intrRate),
                        ),
                        const SizedBox(height: 32),
                        DetailCardInfo(
                          label: "기간",
                          value: _getPeriodOptions(productDetail.saveTrm),
                        ),
                        const SizedBox(height: 32),
                        DetailCardInfo(
                          label: "금액",
                          value: productDetail.maxLimit != null 
                              ? "회당 최대 ${_formatNumber(productDetail.maxLimit!)}"
                              : "제한없음",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 63),
                  Text("상품 정보 자세히 보기", style: AppTypography.h2),
                  const SizedBox(height: 16),
                  _buildProductDetailInfo(productDetail),
                  const SizedBox(height: 48),
                  Text("만기 금액 미리보기", style: AppTypography.h2),
                  const SizedBox(height: 18),
                  // 시뮬레이션 설정
                  Row(
                    spacing: 12,
                    children: [
                      EditBtn(
                        text: "${state.selectedPeriod}개월 간",
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                            ),
                            builder: (context) {
                              return ProductPeriodBottomSheet(
                                availablePeriods: productDetail.saveTrm,
                                initialPeriod: state.selectedPeriod,
                                onPeriodSelected: (period) {
                                  if (productId != null) {
                                    ref.read(savingsProductDetailControllerProvider.notifier)
                                        .updatePeriod(period, productId);
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                      EditBtn(
                        text: _formatCurrency(state.selectedAmount),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                            ),
                            builder: (context) {
                              return SelectDepositAmountBottomSheet(
                                maxAmount: productDetail.maxLimit,
                                initialAmount: state.selectedAmount,
                                onAmountSelected: (amount) {
                                  if (productId != null) {
                                    ref.read(savingsProductDetailControllerProvider.notifier)
                                        .updateAmount(amount, productId);
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
                      Text(
                        "씩 납부하면",
                        style: AppTypography.m600.copyWith(
                          color: AppColors.gr600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (state.isLoadingPreview)
                    Center(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Lottie.asset(
                          Assets.lottie.loading,
                          repeat: true,
                          animate: true,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  else if (maturityPreview != null) ...[
                    // 파프 서비스 결과
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                      decoration: BoxDecoration(
                        color: AppColors.wt,
                        borderRadius: BorderRadius.circular(AppRadius.button),
                        border: Border.all(
                          color: AppColors.secondarySk,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "파프에서는 총",
                              style: AppTypography.l600.copyWith(
                                color: AppColors.gr600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              _formatNumber(maturityPreview.ourService.totalAmount.round()),
                              style: AppTypography.h2.copyWith(
                                color: AppColors.primarySky,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            children: [
                              SimulationCardInfo(
                                label: "원금",
                                value: _formatNumber(maturityPreview.ourService.principal),
                              ),
                              const SizedBox(height: 8),
                              SimulationCardInfo(
                                label: "예상 이자",
                                value: _formatNumber(maturityPreview.ourService.interest),
                              ),
                              const SizedBox(height: 8),
                              SimulationCardInfo(
                                label: "세금",
                                value: _formatNumber(maturityPreview.ourService.tax),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // 우대금리 결과
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                      decoration: BoxDecoration(
                        color: AppColors.wt,
                        borderRadius: BorderRadius.circular(AppRadius.button),
                        border: Border.all(
                          color: AppColors.secondarySk,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "우대금리 적용시 총",
                              style: AppTypography.l600.copyWith(
                                color: AppColors.gr600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              _formatNumber(maturityPreview.preferentialRate.totalAmount.round()),
                              style: AppTypography.h2.copyWith(
                                color: AppColors.primarySky,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            children: [
                              SimulationCardInfo(
                                label: "원금",
                                value: _formatNumber(maturityPreview.preferentialRate.principal),
                              ),
                              const SizedBox(height: 8),
                              SimulationCardInfo(
                                label: "예상 이자",
                                value: _formatNumber(maturityPreview.preferentialRate.interest),
                              ),
                              const SizedBox(height: 8),
                              SimulationCardInfo(
                                label: "세금",
                                value: _formatNumber(maturityPreview.preferentialRate.tax),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Align(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) {
                            return const BaseModal(
                              text: "파프에서 알려드려요",
                              description:
                                  "파프는 금융감독원 공시 데이터 기반\n실제 상품 정보를 다루고 있어요.\n다만 현실에서는 개인별 조건에 따라\n최종 수령액이 달라질 수 있습니다.\n현재는 기본 금리만 반영한 결과를 제공해\n현실과 차이가 날 수 있답니다!",
                              buttonText: "확인했어요",
                            );
                          },
                        );
                      },
                      child: Text(
                        "왜 이런 차이가 생기나요?",
                        style: AppTypography.m600.copyWith(
                          color: AppColors.gr400,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.gr400,
                          decorationThickness: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: AppColors.wt.withOpacity(0.3),
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: PrimaryFilledButton(
                onPressed: () {
                  context.push("/bank/signup/${widget.productId}");
                },
                label: "가입하기",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetailInfo(productDetail) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.wt,
        borderRadius: BorderRadius.circular(AppRadius.button),
        border: Border.all(color: AppColors.gr200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("우대조건", productDetail.specialCondition),
          const SizedBox(height: 12),
          _buildInfoRow("가입제한", productDetail.joinDeny),
          const SizedBox(height: 12),
          _buildInfoRow("가입대상", productDetail.joinMember),
          const SizedBox(height: 12),
          _buildInfoRow("금리유형", productDetail.intrRateTypeNm),
          const SizedBox(height: 12),
          _buildInfoRow("적립유형", productDetail.rsrvTypeNm),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: AppTypography.m600.copyWith(color: AppColors.gr600),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            style: AppTypography.m400.copyWith(color: AppColors.gr800),
          ),
        ),
      ],
    );
  }
}
