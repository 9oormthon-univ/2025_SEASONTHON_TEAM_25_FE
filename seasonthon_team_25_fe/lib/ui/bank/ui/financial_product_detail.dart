import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/detail_card_info.dart';
import 'package:seasonthon_team_25_fe/ui/bank/widget/edit_btn.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.wt,
      appBar: CustomWhiteAppBar(
        title: '',
        showLeftBtn: true,
        showRightBtn: true,
        onTapLeftBtn: () {
          context.pop();
        },
        onTapRightBtn: () {
          context.pop();
        },
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
                      "은행",
                      style: AppTypography.xl500.copyWith(color: AppColors.wt),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "xx적금",
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
                        DetailCardInfo(label: "금리", value: "연 2.25%~3.55%"),
                        const SizedBox(height: 32),
                        DetailCardInfo(label: "기간", value: "12/24/36개월 중 선택"),
                        const SizedBox(height: 32),
                        DetailCardInfo(label: "금액", value: "회당 최대 N,NNN,NNN원"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 63),
                  Text("상품 정보 자세히 보기", style: AppTypography.h2),
                  // 상품 정보 자세히 보기
                  const SizedBox(height: 48),
                  Text("만기 금액 미리보기", style: AppTypography.h2),
                  const SizedBox(height: 18),
                  Row(
                    spacing: 12,
                    children: [
                      EditBtn(text: "12개월 간", onTap: () {}),
                      EditBtn(text: "100만원", onTap: () {}),
                      Text(
                        "씩 납부하면",
                        style: AppTypography.m600.copyWith(
                          color: AppColors.gr600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
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
                            "N,NNN,NNN원",
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
                              value: "N,NNN,NNN원",
                            ),
                            const SizedBox(height: 8),
                            SimulationCardInfo(label: "예상 이자", value: "N,NNN원"),
                            const SizedBox(height: 8),
                            SimulationCardInfo(label: "세금", value: "N,NNN원"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
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
                            "현실에서는 총",
                            style: AppTypography.l600.copyWith(
                              color: AppColors.gr600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "N,NNN,NNN원",
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
                              value: "N,NNN,NNN원",
                            ),
                            const SizedBox(height: 8),
                            SimulationCardInfo(label: "예상 이자", value: "N,NNN원"),
                            const SizedBox(height: 8),
                            SimulationCardInfo(label: "세금", value: "N,NNN원"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true, // 모달 바깥 영역 터치 시 닫기
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
                          decoration: TextDecoration.underline, // 밑줄
                          decorationColor: AppColors.gr400, // 밑줄 색상 (옵션)
                          decorationThickness: 1, // 밑줄 두께 (옵션)
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
              child: PrimaryFilledButton(onPressed: () {}, label: "가입하기"),
            ),
          ),
        ],
      ),
    );
  }
}
