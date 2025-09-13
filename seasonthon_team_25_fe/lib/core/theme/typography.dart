import 'package:flutter/material.dart';
import 'colors.dart'; // AppColors 사용 시

/*
-- AppTypography 사용 예시 --
Text(
  "Hello World!",
  style: AppTypography.headline,
),
 */

class AppTypography {
  // 기본 텍스트 스타일
  static const TextStyle base = TextStyle(
    fontFamily: 'Pretendard',
    height: 1.5,
    color: AppColors.bk,
  );

  // 변형된 스타일
  // HEADLINES
  static final TextStyle h1 = base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle h2 = base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle h3 = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  // BODY TEXT
  // XL
  static final TextStyle xl400 = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle xl500 = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // L
  static final TextStyle l400 = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle l500 = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle l600 = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  // M
  static final TextStyle m400 = base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle m500 = base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle m600 = base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  // S
  static final TextStyle s400 = base.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
}
