import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_item_entity.dart';
import 'package:seasonthon_team_25_fe/ui/news/widgets/news_list_item.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.items,
    required this.isLoadingMore,
    required this.onTapItem,
  });

  final List<NewsItemEntity> items;
  final bool isLoadingMore;
  final void Function(NewsItemEntity) onTapItem;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('뉴스 불러오는 중'));
    }

    final itemCount = isLoadingMore ? items.length + 1 : items.length;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      itemCount: itemCount,
      itemBuilder: (context, i) {
        if (i >= items.length) {
          // 바닥 로딩 셀
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primarySky,
                strokeWidth: 2.0,
              ),
            ),
          );
        }
        final item = items[i];
        return NewsListItem(item: item, onTap: () => onTapItem(item));
      },
    );
  }
}
