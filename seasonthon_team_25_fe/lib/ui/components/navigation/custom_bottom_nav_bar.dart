import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/navigation/nav_item_data.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<NavItemData> items;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.wt,
        boxShadow: AppShadows.dsBS,
        borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
      ),
      child: SafeArea(
        // 하단 배치
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(items.length, (i) {
            return _CustomNavItem(
              item: items[i],
              selected: i == selectedIndex,
              onTap: () => onTap(i),
            );
          }),
        ),
      ),
    );
  }
}

// 개별 네비게이션 아이템 위젯
class _CustomNavItem extends StatelessWidget {
  final NavItemData item;
  final bool selected;
  final VoidCallback onTap;

  const _CustomNavItem({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  static const _duration = Duration(milliseconds: 180);
  static const _padding = EdgeInsets.symmetric(vertical: 8);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          duration: _duration,
          curve: Curves.easeOut,
          padding: _padding,
          decoration: selected
              ? BoxDecoration(
                  color: AppColors.sk_25,
                  borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
                )
              : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              selected ? item.iconFilled.svg() : item.iconOutlined.svg(),
              const SizedBox(height: 6),
              SizedBox(
                height: 35,
                child: Text(
                  item.label,
                  style: selected
                      ? AppTypography.s500.copyWith(color: AppColors.primarySky)
                      : AppTypography.s400.copyWith(
                          color: AppColors.primarySky,
                        ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
