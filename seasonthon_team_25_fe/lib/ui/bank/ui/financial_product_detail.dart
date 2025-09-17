import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_white_app_bar.dart';

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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 118, 20, 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff2a94ea), Color(0xfffafafa)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "은행",
                style: AppTypography.xl500.copyWith(color: AppColors.wt),
              ),
              const SizedBox(height: 8),
              Text(
                "xx적금",
                style: AppTypography.h1.copyWith(color: AppColors.wt),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(45, 20, 45, 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
