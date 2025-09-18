import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/coin_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/secondary_outlined_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';
import 'package:seasonthon_team_25_fe/ui/components/modal/dubble_btn_modal.dart';
import 'package:seasonthon_team_25_fe/ui/components/speech_bubble/speech_bubble.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

// 예시를 위한 Mock 데이터 클래스
class Product {
  final String name;
  final String amount;
  final String joinDate;
  final int remainingPayments;
  final double progressPercentage;

  Product({
    required this.name,
    required this.amount,
    required this.joinDate,
    required this.remainingPayments,
    required this.progressPercentage,
  });
}

class FinancialProductInProgressPage extends ConsumerStatefulWidget {
  const FinancialProductInProgressPage({super.key});

  @override
  ConsumerState<FinancialProductInProgressPage> createState() =>
      _FinancialProductInProgressPageState();
}

class _FinancialProductInProgressPageState
    extends ConsumerState<FinancialProductInProgressPage> {
  bool isEmpty = false; // 금융 상품이 없는 상태를 나타내는 변수

  // Mock 데이터 리스트
  final List<Product> mockProducts = [
    Product(
      name: "첫 번째 적금",
      amount: "1,000,000원",
      joinDate: "2026.01.01",
      remainingPayments: 5,
      progressPercentage: 60,
    ),
    Product(
      name: "두 번째 적금",
      amount: "2,500,000원",
      joinDate: "2026.06.15",
      remainingPayments: 10,
      progressPercentage: 30,
    ),
    Product(
      name: "세 번째 적금",
      amount: "5,000,000원",
      joinDate: "2026.03.20",
      remainingPayments: 1,
      progressPercentage: 95,
    ),
  ];

  // 현재 보여줄 아이템의 인덱스
  int _currentIndex = 0;

  void _goNext() {
    setState(() {
      if (_currentIndex < mockProducts.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _goPrevious() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(coinProvider.notifier).loadBalance();
    });
  }

  @override
  Widget build(BuildContext context) {
    final balance = ref.watch(
      coinProvider.select((state) => state.asData?.value ?? 0),
    );

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '진행 중인 금융 상품',
        showLeftBtn: true,
        showRightBtn: false,
        onTapLeftBtn: () {
          context.go("/bank");
        },
      ),
      body: SingleChildScrollView(
        child: isEmpty
            ? Center(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      "가입한 금융 상품이 없습니다",
                      style: AppTypography.h3.copyWith(
                        color: AppColors.primarySky,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "힌트: 금융 상품을 가입하여 칭호를 획득해보세요!",
                      style: AppTypography.l400.copyWith(
                        color: AppColors.sk_50,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.fromLTRB(20, 23, 20, 10),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.topLeft,
                      child: CoinBalanceChip(
                        balance: balance.toInt(),
                        backgroundColor: AppColors.sk_25,
                        textColor: AppColors.primarySky,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // 진행 중인 금융 상품 카드
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.wt,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: AppShadows.dsDefault,
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 24,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 9.33,
                                    vertical: 12.67,
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: _currentIndex > 0
                                        ? AppColors.primarySky
                                        : AppColors.gr200,
                                  ),
                                ),
                                onPressed: _currentIndex > 0
                                    ? _goPrevious
                                    : null,
                              ),
                              Column(
                                children: [
                                  Text(
                                    mockProducts[_currentIndex].name,
                                    style: AppTypography.h3.copyWith(
                                      color: AppColors.primarySky,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${mockProducts[_currentIndex].amount}원',
                                    style: AppTypography.l500.copyWith(
                                      color: AppColors.gr600,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 9.33,
                                    vertical: 12.67,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color:
                                        _currentIndex < mockProducts.length - 1
                                        ? AppColors.primarySky
                                        : AppColors.gr200,
                                  ),
                                ),
                                onPressed:
                                    _currentIndex < mockProducts.length - 1
                                    ? _goNext
                                    : null,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // 이미지
                          Stack(
                            alignment: Alignment.topCenter,
                            clipBehavior: Clip.none,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: 250,
                                    height: 300,
                                    child: SfRadialGauge(
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                          minimum: 0,
                                          maximum: 100,
                                          showLabels: false,
                                          showTicks: false,
                                          axisLineStyle: const AxisLineStyle(
                                            thickness: 0.2,
                                            thicknessUnit: GaugeSizeUnit.factor,
                                          ),
                                          pointers: <GaugePointer>[
                                            RangePointer(
                                              value: mockProducts[_currentIndex]
                                                  .progressPercentage,
                                              cornerStyle: CornerStyle
                                                  .bothCurve, // 양 끝 곡선 처리
                                              width: 0.2, // 게이지 두께
                                              sizeUnit:
                                                  GaugeSizeUnit.factor, // 비율 단위
                                              color:
                                                  AppColors.secondarySk, // 색상
                                            ),
                                          ],
                                          annotations: <GaugeAnnotation>[
                                            GaugeAnnotation(
                                              widget: Text(''),
                                              angle: 90,
                                              positionFactor:
                                                  0.5, // 게이지 안쪽 중앙에 표시
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Glow 효과용 (뒤에 배경처럼 퍼지는 블러)
                                  ImageFiltered(
                                    imageFilter: ImageFilter.blur(
                                      sigmaX: 3, // 블러 강도 (값이 클수록 멀리 퍼짐)
                                      sigmaY: 3,
                                    ),
                                    child: ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                        AppColors.sk_75, // 원하는 Glow 색상
                                        BlendMode.srcATop,
                                      ),
                                      child: Image(
                                        image: Assets
                                            .images
                                            .onboarding
                                            .faffNocircle
                                            .provider(),
                                        width: 120, // 원본보다 크게 → Glow 퍼지는 느낌
                                        height: 174.3,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),

                                  // 앞쪽 선명한 원본 이미지
                                  Image(
                                    image: Assets.images.onboarding.faffNocircle
                                        .provider(),
                                    width: 120,
                                    height: 174.3,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 20,
                                child: SpeechBubble(
                                  nip: BubbleNip.bottomCenter,
                                  color: AppColors.wt,
                                  radius: AppRadius.button,
                                  elevation: 8,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  child: Text(
                                    "${mockProducts[_currentIndex].progressPercentage}%",
                                    style: AppTypography.h1.copyWith(
                                      color: AppColors.secondaryBl,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "가입 ${mockProducts[_currentIndex].joinDate}",
                                style: AppTypography.h3.copyWith(
                                  color: AppColors.primarySky,
                                ),
                              ),
                              Text(
                                "만기까지 ${mockProducts[_currentIndex].remainingPayments}회",
                                style: AppTypography.h3.copyWith(
                                  color: AppColors.primarySky,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: PrimaryFilledButton(
                            label: "입금하기",
                            onPressed: () {
                              debugPrint("입금하기 버튼 클릭!");
                              // 입금 로직
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: SecondaryOutLinedButton(
                            label: "해지하기",
                            onPressed: () {
                              debugPrint("해지하기 버튼 클릭!");
                              showDialog(
                                context: context,
                                barrierDismissible: true, // 모달 바깥 영역 터치 시 닫기
                                builder: (context) {
                                  return DubbleBtnModal(
                                    text: "해지 확인",
                                    description:
                                        "해지 시, 약정된 이자 혜택이 사라질 수 있습니다.\n위 내용에 동의하고 금융 상품을 해지할까요?",
                                    buttonText1: "네, 해지할래요",
                                    buttonText2: "그만두기",
                                    clickBtn1: () {
                                      context.pop();
                                    },
                                    clickBtn2: () {
                                      context.pop();
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
