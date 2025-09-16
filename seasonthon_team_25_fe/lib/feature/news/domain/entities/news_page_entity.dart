import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_item_entity.dart';

class NewsPageEntity {
  final List<NewsItemEntity> items;
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final int totalElements;
  final bool first;
  final bool last;
  final int numberOfElements;
  final bool empty;

  const NewsPageEntity({
    required this.items,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.totalElements,
    required this.first,
    required this.last,
    required this.numberOfElements,
    required this.empty,
  });
}
