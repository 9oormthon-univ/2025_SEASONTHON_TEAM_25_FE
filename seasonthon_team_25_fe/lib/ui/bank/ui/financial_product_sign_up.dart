// 금융 상품 가입
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_subscription_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/usecases/subscribe_savings_usecase.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/presentation/provider/savings_product_detail_controller.dart';
import 'package:seasonthon_team_25_fe/feature/home/presentation/provider/coin_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/secondary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/chip/coin_balance_chip.dart';
import 'package:seasonthon_team_25_fe/ui/components/modal/savings_subscription_confirm_modal.dart';

class FinancialProductSignUpPage extends ConsumerStatefulWidget {
  final String productId;
  const FinancialProductSignUpPage({super.key, required this.productId});

  @override
  ConsumerState<FinancialProductSignUpPage> createState() =>
      _FinancialProductSignUpPageState();
}

class _FinancialProductSignUpPageState
    extends ConsumerState<FinancialProductSignUpPage> {
  int _currentStep = 0;
  String? _selectedPeriod;
  int? _selectedPeriodMonths;
  final _amountController = TextEditingController();
  bool _isPeriodDropdownOpen = false;
  bool _isLoading = false;
  bool _showConfetti = false;
  SavingsSubscriptionEntity? _subscriptionResult;

  @override
  void initState() {
    super.initState();
    final productId = int.tryParse(widget.productId);
    if (productId != null) {
      Future.microtask(() {
        ref.read(coinProvider.notifier).loadBalance();
        ref
            .read(savingsProductDetailControllerProvider.notifier)
            .loadProductDetail(productId);
      });
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  String _formatCurrency(int amount) {
    final formatter = NumberFormat('#,###');
    return "${formatter.format(amount)}원";
  }

  @override
  Widget build(BuildContext context) {
    final balance = ref.watch(
      coinProvider.select((state) => state.asData?.value ?? 0),
    );
    final detailState = ref.watch(savingsProductDetailControllerProvider);
    final productDetail = detailState.productDetail;

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '금융 상품 가입하기',
        showLeftBtn: true,
        showRightBtn: true,
        onTapLeftBtn: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep--;
            });
          } else {
            context.pop();
          }
        },
        onTapRightBtn: () {
          context.go("/bank");
        },
      ),
      body: IndexedStack(
        index: _currentStep,
        children: [
          _buildStep1(balance.toDouble(), productDetail),
          _buildStep2(balance.toDouble(), productDetail),
          _buildStep3(),
        ],
      ),
    );
  }

  Widget _buildStep1(double balance, productDetail) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 23, 20, 35),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoinBalanceChip(
              balance: balance.toInt(),
              backgroundColor: AppColors.sk_25,
              textColor: AppColors.primarySky,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
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
                    productDetail?.productName ?? "적금 이름",
                    style: AppTypography.h3.copyWith(
                      color: AppColors.primarySky,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isPeriodDropdownOpen = !_isPeriodDropdownOpen;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          "기간 선택",
                          style: AppTypography.h3.copyWith(
                            color: AppColors.primarySky,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Transform.rotate(
                          angle: _isPeriodDropdownOpen ? 3.14159 : 0,
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
            if (_isPeriodDropdownOpen && productDetail != null)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.wt,
                  borderRadius: BorderRadius.circular(AppRadius.button),
                  boxShadow: AppShadows.dsDefault,
                ),
                child: Column(
                  children: productDetail.saveTrm.map<Widget>((period) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          _selectedPeriod = "$period개월";
                          _selectedPeriodMonths = period;
                          _isPeriodDropdownOpen = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                        width: double.infinity,
                        child: Text(
                          "$period개월",
                          style: AppTypography.m600.copyWith(
                            color: AppColors.gr800,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            const SizedBox(height: 36),
            const Divider(color: AppColors.gr200, thickness: 1),
            const SizedBox(height: 24),
            Text("회당 얼마를 입금할까요?", style: AppTypography.h2),
            const SizedBox(height: 4),
            Text(
              productDetail?.maxLimit != null
                  ? "해당 상품의 1회 최대 납입 금액은 ${_formatCurrency(productDetail.maxLimit)}이에요"
                  : "해당 상품의 1회 납입 금액 제한이 없어요",
              style: AppTypography.m400.copyWith(color: AppColors.gr600),
            ),
            const SizedBox(height: 16),
            Text(
              "1회당",
              style: AppTypography.m600.copyWith(color: AppColors.secondaryBl),
            ),
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 48),
              child: TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.sk_25,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  hintText: "금액을 입력하세요",
                  suffixText: "원",
                ),
              ),
            ),
            const SizedBox(height: 36),
            PrimaryFilledButton(
              label: _isLoading ? "가입 중..." : "가입하기",
              onPressed: () {
                if (!_isLoading && _canProceedToNext()) {
                  _showSubscriptionConfirmModal();
                }
              },
              customWidth: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep2(double balance, productDetail) {
    return _buildStep1(balance, productDetail);
  }

  Widget _buildStep3() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),
              Assets.images.characters.faffLove.image(width: 200, height: 200),
              const SizedBox(height: 24),
              Text(
                "짝짝짝, 가입이 완료되었어요!",
                style: AppTypography.h2.copyWith(color: AppColors.gr800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                _subscriptionResult != null
                    ? "${_formatCurrency(int.parse(_amountController.text))}씩 $_selectedPeriodMonths회 자동으로 납입될 예정이며,\n만기 예정일은 ${_subscriptionResult!.maturityDate}이에요"
                    : "가입 정보를 불러오는 중이에요",
                style: AppTypography.m400.copyWith(color: AppColors.gr600),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              PrimaryFilledButton(
                label: "가입 내역 보러가기",
                onPressed: () {
                  context.go("/bank/inprogress");
                },
                customWidth: double.infinity,
              ),
              const SizedBox(height: 16),
              SecondaryFilledButton(
                label: "홈으로",
                onPressed: () {
                  context.go("/bank");
                },
                customWidth: double.infinity,
              ),
            ],
          ),
        ),
        if (_showConfetti)
          Center(
            child: Lottie.asset(
              'assets/lottie/confetti.json',
              repeat: false,
              onLoaded: (composition) {
                Future.delayed(const Duration(seconds: 2), () {
                  if (mounted) {
                    setState(() => _showConfetti = false);
                  }
                });
              },
            ),
          ),
      ],
    );
  }

  bool _canProceedToNext() {
    return _selectedPeriod != null && _amountController.text.isNotEmpty;
  }

  Future<void> _subscribeSavings() async {
    if (!_canProceedToNext()) return;
    setState(() {
      _isLoading = true;
    });
    try {
      final subscribeUseCase = ref.read(subscribeSavingsUseCaseProvider);
      final request = SavingsSubscriptionRequestEntity(
        productSnapshotId: widget.productId,
        termMonths: _selectedPeriodMonths.toString(),
        autoDebitAmount: _amountController.text,
        reserveType: "",
      );
      final result = await subscribeUseCase(request);
      setState(() {
        _subscriptionResult = result;
        _currentStep = 2;
        _isLoading = false;
        _showConfetti = true;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog(e.toString());
    }
  }

  void _showSubscriptionConfirmModal() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SavingsSubscriptionConfirmModal(
        onConfirm: () {
          Navigator.of(context).pop();
          _subscribeSavings();
        },
        onCancel: () {
          Navigator.of(context).pop();
          setState(() {
            _isLoading = false;
          });
        },
      ),
    );
  }

  void _showErrorDialog(String error) {
    String message = "가입에 실패했습니다.";
    if (error.contains("SAV009")) {
      message = "이미 가입한 적금에 또 가입할 수 없습니다.";
    } else if (error.contains("SAV011")) {
      message = "요청 금액이 최고 한도를 초과합니다.";
    } else if (error.contains("VALIDATION001")) {
      message = "입력값 검증에 실패했습니다.";
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("가입 실패"),
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
}
