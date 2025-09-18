import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';

class SavingsTermExplanationModal extends StatelessWidget {
  final String term;
  final String description;
  final VoidCallback onClose;
  
  const SavingsTermExplanationModal({
    super.key,
    required this.term,
    required this.description,
    required this.onClose,
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
                const SizedBox(width: 20), // 중앙 정렬을 위한 공간
                Expanded(
                  child: Text(
                    '금융 용어 설명',
                    style: AppTypography.h3.copyWith(
                      color: AppColors.gr800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: onClose,
                  child: const Icon(
                    Icons.close,
                    color: AppColors.gr600,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // 용어 제목
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.sk_25,
                borderRadius: BorderRadius.circular(AppRadius.button),
                border: Border.all(
                  color: AppColors.primarySky,
                  width: 1,
                ),
              ),
              child: Text(
                term,
                style: AppTypography.h3.copyWith(
                  color: AppColors.primarySky,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            
            // 설명 내용
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.gr100,
                borderRadius: BorderRadius.circular(AppRadius.button),
              ),
              child: Text(
                description,
                style: AppTypography.l500.copyWith(
                  color: AppColors.gr600,
                  height: 1.6,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 24),
            
            // 확인 버튼
            PrimaryFilledButton(
              label: '확인',
              onPressed: onClose,
              customWidth: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
