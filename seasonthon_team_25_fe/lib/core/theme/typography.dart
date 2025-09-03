// 라이트 모드, 다크 모드 설정
import 'package:flutter/material.dart';
import 'colors.dart'; // AppColors 사용 시

/*
Text(
  "안녕하세요!",
  style: AppTypography.headline,
),

hintStyle: AppTypography.l400.copyWith(
    color: AppColors.g500,
  ), 
 */
class AppTypography {
  // 기본 텍스트 스타일
  static const TextStyle base = TextStyle(
    fontFamily: 'Pretendard',
    height: 1.5,
  );

  // 변형된 스타일
  static final TextStyle h1 = base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.wt,
  );

  static final TextStyle xl500 = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.bk,
  );

  static final TextStyle l500 = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.gr600,
  );

  static final TextStyle m500 = base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.wt.withValues(alpha: .5),
  );
}
