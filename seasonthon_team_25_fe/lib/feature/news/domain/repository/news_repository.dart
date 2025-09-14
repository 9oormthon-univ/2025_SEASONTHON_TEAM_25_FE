import 'package:seasonthon_team_25_fe/feature/news/domain/entities/new_detail_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_item_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_page_entity.dart';

abstract class NewsRepository {
  Future<NewsPageEntity> fetchNewsPage({int page = 0, int size = 10});

  Future<List<NewsItemEntity>> fetchNewsList({int size = 10});
  Future<NewsDetailEntity> fetchNewsDetail(int id);
}
