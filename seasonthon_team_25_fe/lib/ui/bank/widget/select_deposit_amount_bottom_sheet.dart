import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';

class SelectDepositAmountBottomSheet extends StatelessWidget {
  final double maxAmount;

  const SelectDepositAmountBottomSheet({super.key, required this.maxAmount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.wt,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.bottomSheet),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primarySky.withOpacity(0.5), // 그림자 색상
            blurRadius: 10.0, // 블러 반경
            offset: Offset(0, -5), // 위로 5픽셀만큼 이동
          ),
        ],
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
          Text("입금 금액 선택", style: AppTypography.h3),
          const SizedBox(height: 7),
          Text(
            "최소 예치 금액은 $maxAmount원이에요",
            style: AppTypography.m500.copyWith(color: AppColors.gr600),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "1회당",
              style: AppTypography.m600.copyWith(color: AppColors.secondaryBl),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 48),
            decoration: BoxDecoration(
              color: AppColors.wt,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppRadius.bottomSheet),
                topRight: Radius.circular(AppRadius.bottomSheet),
              ),
              boxShadow: AppShadows.dsBS,
            ),
            child: TextFormField(
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
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          PrimaryFilledButton(
            label: "적용하기",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
