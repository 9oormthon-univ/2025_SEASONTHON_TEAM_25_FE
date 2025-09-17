import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class ProductPeriodBottomSheet extends StatelessWidget {
  const ProductPeriodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.wt,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.bottomSheet),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 핸들바
          Center(
            child: Container(
              height: 5,
              width: 144,
              decoration: BoxDecoration(
                color: AppColors.gr200,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text("상품 기간 선택", style: AppTypography.h3),
          const SizedBox(height: 7),
          Text(
            "12, 24, 36개월 중 선택 가능해요",
            style: AppTypography.m500.copyWith(color: AppColors.gr600),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "총",
              style: AppTypography.m600.copyWith(color: AppColors.secondaryBl),
            ),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 48),
              decoration: BoxDecoration(
                color: AppColors.sk_25,
                borderRadius: BorderRadius.all(
                  Radius.circular(AppRadius.bottomSheet),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "개월",
                    style: AppTypography.h2.copyWith(
                      color: AppColors.secondaryBl,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 9.5,
                      horizontal: 7,
                    ),
                    child: SvgPicture.asset(
                      Assets.images.bank.primaryToggleBtn.path,
                      width: 5,
                      height: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          // PrimaryFilledButton(
          //   label: "적용하기",
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
