import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/bottom_sheet/base_bottom_sheet.dart';

class SortBottomSheet extends StatefulWidget {
  final String initial;
  final void Function(String) onApply;

  const SortBottomSheet({
    super.key,
    required this.initial,
    required this.onApply,
  });

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  late String _selected;

  final options = ["기본순", "인기순"];

  @override
  void initState() {
    super.initState();
    _selected = widget.initial == "popular" ? "인기순" : "기본순";
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      title: "정렬 방식 선택",
      onApply: () {
        Navigator.pop(context);
        widget.onApply(_selected);
      },
      child: Column(
        children: [
          ...options.map((opt) {
            return RadioListTile<String>(
              value: opt,
              groupValue: _selected,
              title: Text(
                opt,
                style: AppTypography.l500.copyWith(color: AppColors.gr600),
              ),
              activeColor: AppColors.primarySky,
              onChanged: (val) {
                if (val != null) {
                  setState(() => _selected = val);
                }
              },
            );
          }),
        ],
      ),
    );
  }
}
