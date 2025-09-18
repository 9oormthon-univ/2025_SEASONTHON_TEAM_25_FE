import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/ui/components/bottom_sheet/base_bottom_sheet.dart';

class BankFilterBottomSheet extends StatefulWidget {
  final List<String> banks;
  final String? initial; // "국민은행,신한은행" 형식
  final void Function(String) onApply;

  const BankFilterBottomSheet({
    super.key,
    required this.banks,
    required this.onApply,
    this.initial,
  });

  @override
  State<BankFilterBottomSheet> createState() => _BankFilterBottomSheetState();
}

class _BankFilterBottomSheetState extends State<BankFilterBottomSheet> {
  late Set<String> _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initial != null && widget.initial!.isNotEmpty
        ? widget.initial!.split(",").toSet()
        : {"전체 은행"};
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      title: "상품 기관 선택",
      onApply: () {
        Navigator.pop(context);
        if (_selected.contains("전체 은행")) {
          widget.onApply("전체 은행");
        } else {
          widget.onApply(_selected.join(",")); 
          // {"국민은행","신한은행"} → "국민은행,신한은행"
        }
      },
      child: ListView(
        children: widget.banks.map((bank) {
          final isSelected = _selected.contains(bank);
          return ListTile(
            title: Text(
              bank,
              style: AppTypography.l500.copyWith(
                color: isSelected ? AppColors.primarySky : AppColors.gr600,
              ),
            ),
            trailing: isSelected
                ? const Icon(Icons.check, color: AppColors.primarySky)
                : null,
            onTap: () {
              setState(() {
                if (bank == "전체 은행") {
                  _selected = {"전체 은행"}; // 전체 은행만 단독 선택
                } else {
                  _selected.remove("전체 은행");
                  if (isSelected) {
                    _selected.remove(bank);
                  } else {
                    _selected.add(bank);
                  }
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
