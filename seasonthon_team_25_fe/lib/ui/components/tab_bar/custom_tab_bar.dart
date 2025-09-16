import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/shadows.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> labels; // 2개
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const CustomTabBar({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
  }) : assert(labels.length == 2, 'labels는 2개여야 합니다.');

  static const _duration = Duration(milliseconds: 0);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(labels.length, (i) {
        final selected = i == selectedIndex;
        return Expanded(
          child: Padding(
            // 그림자가 자연스럽게 보이도록 좌우 여백
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: InkWell(
              borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
              onTap: () => onChanged(i),
              child: AnimatedContainer(
                duration: _duration,
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  // 선택된 탭만 박스 + 그림자
                  color: selected ? AppColors.wt : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppRadius.bottomSheet),
                  boxShadow: selected ? AppShadows.dsDefault : const [],
                ),
                child: Center(
                  child: Text(
                    labels[i],
                    textAlign: TextAlign.center,
                    style: selected
                        ? AppTypography.l600.copyWith(
                            color: AppColors.primarySky,
                          )
                        : AppTypography.l500.copyWith(color: AppColors.gr600),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
