import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_item_entity.dart';
import 'package:seasonthon_team_25_fe/ui/news/widgets/news_card_item.dart';

class NewsSwipeView extends StatelessWidget {
  const NewsSwipeView({
    super.key,
    required this.items,
    required this.isLoading,
    required this.onTapItem,
    this.cardHeight = 350,
    this.viewportFraction = 0.8, // 옆 카드 노출 정도
    this.sideScale = 0.9, // 옆 카드 축소 → 중앙 카드 돌출
  });

  final List<NewsItemEntity> items;
  final bool isLoading;
  final void Function(NewsItemEntity) onTapItem;

  final double cardHeight;
  final double viewportFraction;
  final double sideScale;

  String _dateOnly(dynamic raw) {
    if (raw == null) return '';
    if (raw is DateTime) return raw.toIso8601String().split('T').first;
    if (raw is String) {
      final i = raw.indexOf('T');
      return i > 0 ? raw.substring(0, i) : raw;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    if (items.isEmpty) return const Center(child: Text('뉴스를 불러오는 중...'));

    return SizedBox(
      height: 500,
      child: Swiper(
        itemCount: items.length,
        loop: false,
        physics: const BouncingScrollPhysics(),
        viewportFraction: viewportFraction,
        scale: sideScale,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => onTapItem(item),
              child: NewsCardItem(
                title: item.title,
                date: _dateOnly(item.approveDate),
                aiSummary: (item.aiSummary).trim(),
                ministerCode: (item.ministerCode).trim(),
                thumbnailUrl: (item.thumbnailUrl).trim(),
              ),
            ),
          );
        },
      ),
    );
  }
}
