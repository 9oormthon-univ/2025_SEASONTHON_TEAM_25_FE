import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class CustomWhiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  // 좌측 버튼
  final bool showLeftBtn;
  final VoidCallback? onTapLeftBtn;

  // 우측 버튼
  final bool showRightBtn;
  final VoidCallback? onTapRightBtn;

  final Color backgroundColor;
  final double toolbarHeight;

  const CustomWhiteAppBar({
    super.key,
    required this.title,
    this.showLeftBtn = false,
    this.onTapLeftBtn,
    this.showRightBtn = false,
    this.onTapRightBtn,
    this.backgroundColor = Colors.transparent,
    this.toolbarHeight = kToolbarHeight,
  });

  // 부모 클래스가 appbar 높이를 알 수 있도록 함
  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      automaticallyImplyLeading: false, // 기본 leading 제거
      toolbarHeight: toolbarHeight,

      leading: showLeftBtn
          ? IconButton(
              padding: EdgeInsets.symmetric(horizontal: 9.5, vertical: 7.0),
              constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
              icon: SvgPicture.asset(
                Assets.images.components.whiteBackArrow.path,
                width: 24,
                height: 24,
              ),
              onPressed: onTapLeftBtn ?? () => Navigator.of(context).maybePop(),
            )
          : null,

      title: Text(title, style: AppTypography.h3.copyWith(color: AppColors.wt)),

      actions: showRightBtn
          ? [
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 9.5, vertical: 7.0),
                constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
                icon: SvgPicture.asset(
                  Assets.images.components.whiteXIcon.path,
                  width: 24,
                  height: 24,
                ),
                onPressed: onTapRightBtn ?? () => Navigator.of(context).pop(),
              ),
            ]
          : null,
    );
  }
}
