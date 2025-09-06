import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';

class FinancialListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const FinancialListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // 왼쪽 텍스트 2줄
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
              ],
            ),
          ),

          // 오른쪽 아이콘 버튼
          IconButton(
            onPressed: onPressed,
            icon: Assets.images.components.goDetailIcon.image(
                  width: 64,
                  height: 64,
                  fit: BoxFit.contain,
                ),
            // tooltip: '가입',
            color: Theme.of(context).primaryColor,
            iconSize: 28,
          ),
        ],
      ),
    );
  }
}