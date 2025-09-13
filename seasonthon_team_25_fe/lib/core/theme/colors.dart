import 'package:flutter/material.dart';

class AppColors {
  // PRIMARY COLORS
  static const primarySky = Color(0xFF188AE6);

  // SECONDARY COLORS
  static const secondaryIv = Color(0xFFFEF8E0);
  static const secondaryRd = Color(0xFFF75547);
  static const secondaryBl = Color(0xFF005396);
  static final secondarySk = Color(0xFF89C2F0);

  // GRAY SCALE COLORS
  static const bk = Color(0xFF141416);
  static const gr800 = Color(0xFF55555A);
  static const gr600 = Color(0xFF79797F);
  static const gr400 = Color(0xFFC2C3C8);
  static const gr200 = Color(0xFFECEDEF);
  static const gr100 = Color(0xFFF6F7F8);
  static final wt = Color(0xFFFAFAFA);

  // TRANSPARENCY COLORS
  static final sk_25 = primarySky.withValues(alpha: .25);
  static final sk_50 = primarySky.withValues(alpha: .50);
  static final sk_75 = primarySky.withValues(alpha: .75);

  static final rd_25 = secondaryRd.withValues(alpha: .25);
  static final rd_75 = secondaryRd.withValues(alpha: .75);

  static final wt_50 = wt.withValues(alpha: .50);
  static final wt_75 = wt.withValues(alpha: .75);
}
