import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/main.dart' show scaffoldMessengerKey;

enum _ToastType { success, error, info }

class ToastUtils {
  static void showSuccessToast(BuildContext? context, String message) {
    _show(context, message, _ToastType.success);
  }

  static void showErrorToast(BuildContext? context, String message) {
    _show(context, message, _ToastType.error);
  }

  static void showInfoToast(BuildContext? context, String message) {
    _show(context, message, _ToastType.info);
  }

  static void _show(BuildContext? context, String message, _ToastType type) {
    Color bg;
    TextStyle style;
    List<BoxShadow> shadow;
    switch (type) {
      case _ToastType.success:
        bg = AppColors.sk_25; style = AppTypography.m500.copyWith(color: AppColors.wt); shadow = AppShadows.dsDefault; break;
      case _ToastType.error:
        bg = AppColors.rd_25; style = AppTypography.m500.copyWith(color: AppColors.wt); shadow = AppShadows.dsRED; break;
      case _ToastType.info:
        bg = AppColors.wt;    style = AppTypography.m500.copyWith(color: AppColors.primarySky); shadow = AppShadows.dsDefault; break;
    }

    final snack = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(seconds: 2),
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppRadius.chips),
          boxShadow: shadow,
        ),
        child: Text(message, style: style, textAlign: TextAlign.center),
      ),
    );

    // 1순위: 받은 context가 ScaffoldMessenger 아래면 사용
    final m1 = (context != null) ? ScaffoldMessenger.maybeOf(context) : null;
    // 2순위: 전역 키 사용 (인터셉터 등 context 없는 곳)
    final m2 = scaffoldMessengerKey.currentState;

    final messenger = m1 ?? m2;
    if (messenger == null) {
      // 아직 프레임 전일 수 있음. 필요하면 로그만 남기고 무시
      debugPrint('ToastUtils: no ScaffoldMessenger available yet.');
      return;
    }

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(snack);
  }
}
