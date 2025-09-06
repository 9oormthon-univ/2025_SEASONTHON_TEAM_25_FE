// 금융 상품 상세 보기

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';
import 'package:seasonthon_team_25_fe/ui/components/reward_box.dart';
import 'package:seasonthon_team_25_fe/feature/bank/repository/product_detail.dart'; // ✅ 방금 작성한 레포 import

class FinancialProductDetailPage extends ConsumerStatefulWidget {
  final String productId;
  const FinancialProductDetailPage({super.key, required this.productId});

  @override
  ConsumerState<FinancialProductDetailPage> createState() =>
      _FinancialProductDetailPageState();
}

class _FinancialProductDetailPageState
    extends ConsumerState<FinancialProductDetailPage> {
  int? balance;
  late Future<ProductDetail> _future; // ✅ API 결과 저장

  @override
  void initState() {
    super.initState();
    _loadBalance();
    _future = ref
        .read(productDetailRepositoryProvider)
        .fetchDetail(int.parse(widget.productId));
  }

  Future<void> _loadBalance() async {
    try {
      final dio = ref.read(dioProvider);
      final res = await dio.get('/api/wallet/balance');
      setState(() {
        balance = res.data['balance'] as int;
      });
    } catch (e) {
      debugPrint('잔액 조회 실패: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        title: '금융 상품 상세 보기',
        showLeft: true,
        showRight: true,
        onTapLeft: () {
          context.go('/bank/list');
        },
      ),
      body: FutureBuilder<ProductDetail>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("불러오기 실패: ${snapshot.error}"));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("상품 정보를 찾을 수 없습니다."));
          }

          final product = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 35),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: RewardBox(
                    text: "${balance?.toString() ?? '-'}원",
                    textColor: AppColors.primary,
                    backgroundColor: AppColors.sk.withValues(alpha: .25),
                  ),
                ),
                const SizedBox(height: 12),

                // 🔹 스크롤 가능 영역
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlurredCard(
                          height: 60,
                          child: Row(
                            children: [
                              Text(
                                product.productName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                product.bankName,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        Text("가입 방법: ${product.joinWay}"),
                        Text("만기이자율: ${product.maturityInterest}"),
                        Text("우대조건: ${product.specialCondition}"),
                        Text("제한사항: ${product.joinDeny}"),
                        Text("가입대상: ${product.joinMember}"),
                        Text("최대 한도: ${product.maxLimit}원"),
                        Text("비고: ${product.etcNote}"),
                        const SizedBox(height: 12),

                        Text("상품 요약: ${product.aiSummary}"),
                        const Divider(height: 24),

                        Text(
                          "금리 옵션",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        ...product.options.map(
                          (opt) => ListTile(
                            title: Text(
                              "${opt.termMonths}개월 · ${opt.reserveTypeName}",
                            ),
                            subtitle: Text(
                              "기본 ${opt.rate}% + 우대 ${opt.ratePreferential}% → ${opt.rate + opt.ratePreferential}%",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 가입하기 버튼
                PrimaryActionButton(
                  isLoading: false,
                  label: "가입하기",
                  // onPressed: () {
                  //   context.go("/bank/sign-up");
                  // },
                  onPressed: () {
                    // 예: 기본 선택값으로 첫 옵션을 사용 (UI에서 선택값 있으면 그걸 사용)
                    final opt = product.options.first;

                    context.go(
                      "/bank/sign-up/${product.productSnapshotId}",
                      extra: SignUpArgs(
                        termMonths: opt.termMonths,
                        maxLimit: product.maxLimit,
                        productName: product.productName,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
