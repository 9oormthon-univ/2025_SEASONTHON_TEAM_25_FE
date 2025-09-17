import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class EditBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const EditBtn({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9.5),
        decoration: BoxDecoration(
          color: AppColors.gr200,
          borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: AppTypography.l600.copyWith(color: AppColors.gr600),
            ),
            const SizedBox(width: 4),
            SvgPicture.asset(
              Assets.images.bank.settingIcon.path,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
