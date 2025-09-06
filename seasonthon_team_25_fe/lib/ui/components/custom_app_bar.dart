import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = '나만의 뱅크',
    this.showLeft = true,
    this.showRight = true,
    this.onTapLeft,
    this.onTapRight,
    this.backgroundColor = Colors.transparent,
  });

  final String title;

  /// 왼쪽 아이콘 보일지 여부
  final bool showLeft;

  /// 오른쪽 아이콘 보일지 여부
  final bool showRight;

  /// 왼쪽 버튼 클릭 이벤트
  /// 지정 안 하면 기본값 = `Navigator.maybePop()`
  final VoidCallback? onTapLeft;

  /// 오른쪽 버튼 클릭 이벤트
  /// 지정 안 하면 기본값 = `Navigator.pop()`
  final VoidCallback? onTapRight;

  /// 배경색
  final Color backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false, // 기본 leading 제거

      leading: showLeft
          ? IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: SvgPicture.asset(
                Assets.images.components.backArrow.path,
                width: 24,
                height: 24,
              ),
              onPressed: onTapLeft ?? () => Navigator.of(context).maybePop(),
            )
          : null,

      title: Text(
        title,
        style: AppTypography.h3.copyWith(color: AppColors.bk),
      ),

      actions: [
        if (showRight)
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: SvgPicture.asset(
              Assets.images.components.xIcon.path,
              width: 24,
              height: 24,
            ),
            onPressed: onTapRight ?? () => Navigator.of(context).pop(),
          ),
      ],
    );
  }
}