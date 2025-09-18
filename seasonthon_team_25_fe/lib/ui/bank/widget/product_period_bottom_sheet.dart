import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';

class ProductPeriodBottomSheet extends StatefulWidget {
  final List<int> availablePeriods;
  final int initialPeriod;
  final Function(int) onPeriodSelected;
  
  const ProductPeriodBottomSheet({
    super.key,
    required this.availablePeriods,
    required this.initialPeriod,
    required this.onPeriodSelected,
  });

  @override
  State<ProductPeriodBottomSheet> createState() => _ProductPeriodBottomSheetState();
}

class _ProductPeriodBottomSheetState extends State<ProductPeriodBottomSheet> {
  late int selectedPeriod;

  @override
  void initState() {
    super.initState();
    selectedPeriod = widget.initialPeriod;
  }

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
            "${widget.availablePeriods.join(', ')}개월 중 선택 가능해요",
            style: AppTypography.m500.copyWith(color: AppColors.gr600),
          ),
          const SizedBox(height: 20),
          ...widget.availablePeriods.map((period) => 
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPeriod = period;
                  });
                  widget.onPeriodSelected(period);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: selectedPeriod == period ? AppColors.primarySky : AppColors.gr100,
                    borderRadius: BorderRadius.circular(AppRadius.button),
                    border: Border.all(
                      color: selectedPeriod == period ? AppColors.primarySky : AppColors.gr200,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "$period개월",
                    style: AppTypography.m600.copyWith(
                      color: selectedPeriod == period ? AppColors.wt : AppColors.gr800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
