import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/usecases/make_savings_payment_usecase.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/presentation/provider/active_savings_controller.dart';
import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/coin_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/secondary_outlined_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';
import 'package:seasonthon_team_25_fe/ui/components/modal/dubble_btn_modal.dart';
import 'package:seasonthon_team_25_fe/ui/components/speech_bubble/speech_bubble.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FinancialProductInProgressPage extends ConsumerStatefulWidget {
  const FinancialProductInProgressPage({super.key});

  @override
  ConsumerState<FinancialProductInProgressPage> createState() =>
      _FinancialProductInProgressPageState();
}

class _FinancialProductInProgressPageState
    extends ConsumerState<FinancialProductInProgressPage> {
  int _currentIndex = 0;
  bool _isPaymentLoading = false;

  void _goNext(int maxLength) {
    setState(() {
      if (_currentIndex < maxLength - 1) {
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

  String _formatCurrency(int amount) {
    return "${(amount / 10000).toStringAsFixed(0)}만원";
  }

  Future<void> _makePayment(int subscriptionId) async {
    setState(() {
      _isPaymentLoading = true;
    });

    try {
      final paymentUseCase = ref.read(makeSavingsPaymentUseCaseProvider);
      final result = await paymentUseCase(subscriptionId);
      
      // 납입 성공 시 적금 목록 새로고침
      await ref.read(activeSavingsControllerProvider.notifier).load();
      
      if (mounted) {
        _showSuccessDialog(result.message);
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(e.toString());
      }
    } finally {
      if (mounted) {
        setState(() {
          _isPaymentLoading = false;
        });
      }
    }
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("납입 완료"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("확인"),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String error) {
    String message = "납입에 실패했습니다.";
    
    if (error.contains("SAV010")) {
      message = "오늘 납입 가능한 회차가 없습니다.";
    } else if (error.contains("WALLET001")) {
      message = "잔액이 부족합니다.";
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("납입 실패"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("확인"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(coinProvider.notifier).loadBalance();
      ref.read(activeSavingsControllerProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final balance = ref.watch(
      coinProvider.select((state) => state.asData?.value ?? 0),
    );
    final activeSavingsState = ref.watch(activeSavingsControllerProvider);

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
        child: activeSavingsState.when(
          loading: () => Center(
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
          error: (err, _) => Center(
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text(
                  "오류가 발생했습니다",
                  style: AppTypography.h3.copyWith(
                    color: AppColors.secondaryRd,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  err.toString(),
                  style: AppTypography.l400.copyWith(
                    color: AppColors.gr600,
                  ),
                ),
              ],
            ),
          ),
          data: (data) {
            final activeSavings = data.activeSavings;
            
            if (activeSavings.isEmpty) {
              return Center(
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
              );
            }
            
            // 인덱스가 범위를 벗어나지 않도록 보정
            if (_currentIndex >= activeSavings.length) {
              _currentIndex = activeSavings.length - 1;
            }
            
            final currentSaving = activeSavings[_currentIndex];
            
            return Container(
              padding: const EdgeInsets.fromLTRB(20, 23, 20, 10),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CoinBalanceChip(
                      balance: balance,
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
                                  currentSaving.productName,
                                  style: AppTypography.h3.copyWith(
                                    color: AppColors.primarySky,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _formatCurrency(currentSaving.currentAmount),
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
                                  color: _currentIndex < activeSavings.length - 1
                                      ? AppColors.primarySky
                                      : AppColors.gr200,
                                ),
                              ),
                              onPressed: _currentIndex < activeSavings.length - 1
                                  ? () => _goNext(activeSavings.length)
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
                                            value: currentSaving.progressPercentage.toDouble(),
                                            cornerStyle: CornerStyle.bothCurve,
                                            width: 0.2,
                                            sizeUnit: GaugeSizeUnit.factor,
                                            color: AppColors.secondarySk,
                                          ),
                                        ],
                                        annotations: <GaugeAnnotation>[
                                          GaugeAnnotation(
                                            widget: const Text(''),
                                            angle: 90,
                                            positionFactor: 0.5,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // Glow 효과용 (뒤에 배경처럼 퍼지는 블러)
                                ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    sigmaX: 3,
                                    sigmaY: 3,
                                  ),
                                  child: ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                      AppColors.sk_75,
                                      BlendMode.srcATop,
                                    ),
                                    child: Image(
                                      image: Assets.images.onboarding.faffNocircle.provider(),
                                      width: 120,
                                      height: 174.3,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                // 앞쪽 선명한 원본 이미지
                                Image(
                                  image: Assets.images.onboarding.faffNocircle.provider(),
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
                                  "${currentSaving.progressPercentage}%",
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
                              "가입 ${currentSaving.joinDate}",
                              style: AppTypography.h3.copyWith(
                                color: AppColors.primarySky,
                              ),
                            ),
                            Text(
                              "만기까지 ${currentSaving.remainingPayments}회",
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
                          label: _isPaymentLoading ? "입금 중..." : "입금하기",
                          onPressed: () {
                            if (!_isPaymentLoading) {
                              _makePayment(currentSaving.subscriptionId);
                            }
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
                              barrierDismissible: true,
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
            );
          },
        ),
      ),
    );
  }
}
