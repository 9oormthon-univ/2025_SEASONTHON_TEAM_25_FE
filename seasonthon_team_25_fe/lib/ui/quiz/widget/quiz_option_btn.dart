import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';

Widget quizOptionButton({
  required BuildContext context,
  required String text,
  required bool hasInteracted, // 한번이라도 클릭이 있었는지
  required bool isSelected,
  required bool showResult,
  required bool isWrong,
  required VoidCallback onTap,
}) {
  // 상태별 색상/스타일 계산
  final Color bgColor = isSelected
      ? (isWrong ? AppColors.secondaryRd : AppColors.primarySky)
      : AppColors.wt;

  final Color borderColor = hasInteracted
      ? (isSelected ? Colors.transparent : AppColors.gr600)
      : AppColors.primarySky;

  final List<BoxShadow> shadows = isSelected
      ? [
          BoxShadow(
            color: isWrong
                ? AppColors.secondaryRd.withOpacity(.75)
                : AppColors.primarySky.withOpacity(.5),
            blurRadius: 12,
            offset: const Offset(0, 0),
          ),
        ]
      : [];

  final TextStyle textStyle = hasInteracted
      ? (isSelected
            ? AppTypography.m600.copyWith(color: AppColors.wt)
            : AppTypography.m400.copyWith(color: AppColors.gr600))
      : AppTypography.m500.copyWith(color: AppColors.primarySky);

  return GestureDetector(
    onTap: showResult ? null : onTap, // ✅ showResult면 비활성화
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppRadius.chips),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: shadows, // 선택 상태일 때만 그림자 적용
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(text, style: textStyle),
      ),
    ),
  );
}
