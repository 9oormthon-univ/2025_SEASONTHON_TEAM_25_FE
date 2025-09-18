import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';

class SelectDepositAmountBottomSheet extends StatefulWidget {
  final int? maxAmount;
  final int initialAmount;
  final Function(int) onAmountSelected;

  const SelectDepositAmountBottomSheet({
    super.key, 
    required this.maxAmount,
    required this.initialAmount,
    required this.onAmountSelected,
  });

  @override
  State<SelectDepositAmountBottomSheet> createState() => _SelectDepositAmountBottomSheetState();
}

class _SelectDepositAmountBottomSheetState extends State<SelectDepositAmountBottomSheet> {
  late TextEditingController _controller;
  late int selectedAmount;

  @override
  void initState() {
    super.initState();
    selectedAmount = widget.initialAmount;
    _controller = TextEditingController(text: selectedAmount.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatCurrency(int amount) {
    return "${(amount / 10000).toStringAsFixed(0)}만원";
  }

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
            widget.maxAmount != null 
                ? "최대 예치 금액은 ${_formatCurrency(widget.maxAmount!)}이에요"
                : "예치 금액 제한없음",
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
              borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
              boxShadow: AppShadows.dsBS,
            ),
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onChanged: (value) {
                final amount = int.tryParse(value.replaceAll(',', ''));
                if (amount != null && (widget.maxAmount == null || amount <= widget.maxAmount!)) {
                  selectedAmount = amount;
                }
              },
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
                  horizontal: 16,
                  vertical: 16,
                ),
                hintText: "금액을 입력하세요",
                suffixText: "원",
              ),
            ),
          ),
          const SizedBox(height: 20),
          // 빠른 선택 옵션들
          Row(
            children: [
              Expanded(
                child: _buildQuickSelectButton("10만원", 100000),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildQuickSelectButton("50만원", 500000),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildQuickSelectButton("100만원", 1000000),
              ),
            ],
          ),
          const SizedBox(height: 20),
          PrimaryFilledButton(
            label: "적용하기",
            onPressed: () {
              widget.onAmountSelected(selectedAmount);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildQuickSelectButton(String label, int amount) {
    final isSelected = selectedAmount == amount;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAmount = amount;
          _controller.text = amount.toString();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primarySky : AppColors.gr100,
          borderRadius: BorderRadius.circular(AppRadius.button),
          border: Border.all(
            color: isSelected ? AppColors.primarySky : AppColors.gr200,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: AppTypography.m600.copyWith(
            color: isSelected ? AppColors.wt : AppColors.gr800,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
