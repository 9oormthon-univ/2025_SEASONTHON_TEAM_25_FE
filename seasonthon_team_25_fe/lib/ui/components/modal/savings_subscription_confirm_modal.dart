import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/secondary_outlined_button.dart';

class SavingsSubscriptionConfirmModal extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  
  const SavingsSubscriptionConfirmModal({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.chips),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        decoration: BoxDecoration(
          color: AppColors.wt,
          borderRadius: BorderRadius.circular(AppRadius.chips),
          boxShadow: AppShadows.dsDefault,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 상단 헤더
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onCancel,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.gr600,
                    size: 20,
                  ),
                ),
                Text(
                  '가입 확인',
                  style: AppTypography.h3.copyWith(
                    color: AppColors.gr800,
                  ),
                ),
                GestureDetector(
                  onTap: onCancel,
                  child: const Icon(
                    Icons.close,
                    color: AppColors.gr600,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // 내용
            Text(
              '미납 2회까지는 금액 차감 후 가입이 유지되나\n'
              '미납이 3회가 되면 상품이 중도 해지돼요!\n'
              '위 내용에 동의하고 상품 가입을 진행할까요?',
              textAlign: TextAlign.center,
              style: AppTypography.l500.copyWith(
                color: AppColors.gr600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            
            // 버튼
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: PrimaryFilledButton(
                    label: '네, 가입할래요',
                    onPressed: onConfirm,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: SecondaryOutLinedButton(
                    label: '그만두기',
                    onPressed: onCancel,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
