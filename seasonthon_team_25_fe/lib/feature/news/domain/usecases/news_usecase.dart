import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/news/data/repository_impl/news_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/new_detail_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_item_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_page_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/repository/news_repository.dart';

class NewsUsecase {
  final NewsRepository _repo;
  NewsUsecase(this._repo);

  Future<NewsPageEntity> fetchPage({int page = 0, int size = 10}) {
    return _repo.fetchNewsPage(page: page, size: size);
  }

  /// 첫 페이지만 간단히 쓰고 싶을 때
  Future<List<NewsItemEntity>> fetchFirstList({int size = 10}) {
    return _repo.fetchNewsList(size: size);
  }

  Future<NewsDetailEntity> fetchDetail(int id) {
    return _repo.fetchNewsDetail(id);
  }
}

/// DI
final newsUsecaseProvider = Provider<NewsUsecase>((ref) {
  final repo = ref.watch(newsRepositoryProvider);
  return NewsUsecase(repo);
});
