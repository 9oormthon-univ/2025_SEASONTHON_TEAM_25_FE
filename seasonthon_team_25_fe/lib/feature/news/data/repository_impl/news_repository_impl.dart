import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/news/data/datasources/remote/news_api.dart';
import 'package:seasonthon_team_25_fe/feature/news/data/models/news_models.dart';
import 'package:seasonthon_team_25_fe/feature/news/data/models/news_detail_models.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/new_detail_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_item_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_page_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApi _remote;
  NewsRepositoryImpl(this._remote);

  @override
  Future<NewsPageEntity> fetchNewsPage({int page = 0, int size = 10}) async {
    try {
      final res = await _remote.fetchNews(page, size);
      return _mapListResponseToEntity(res);
    } catch (e) {
      throw Exception(mapDioError(e));
    }
  }

  @override
  Future<List<NewsItemEntity>> fetchNewsList({int size = 10}) async {
    final page = await fetchNewsPage(page: 0, size: size);
    return page.items;
  }

  @override
  Future<NewsDetailEntity> fetchNewsDetail(int id) async {
    try {
      final res = await _remote.fetchNewsDetail(id);
      return _mapDetailResponseToEntity(res);
    } catch (e) {
      throw Exception(mapDioError(e));
    }
  }

  // ---------- 매핑 ----------

  NewsPageEntity _mapListResponseToEntity(NewsPageResponse res) {
    final items = res.content
        .map(
          (d) => NewsItemEntity(
            id: d.id,
            newsItemId: d.newsItemId,
            title: d.title,
            subTitle1: d.subTitle1,
            subTitle2: d.subTitle2,
            subTitle3: d.subTitle3,
            approveDate: d.approveDate,
            modifyDate: d.modifyDate,
            thumbnailUrl: d.thumbnailUrl,
            aiSummary: d.aiSummary,
            plainTextContent: d.plainTextContent,
            ministerCode: d.ministerCode,
          ),
        )
        .toList();

    return NewsPageEntity(
      items: items,
      pageNumber: res.pageable.pageNumber,
      pageSize: res.pageable.pageSize,
      totalPages: res.totalPages,
      totalElements: res.totalElements,
      first: res.first,
      last: res.last,
      numberOfElements: res.numberOfElements,
      empty: res.empty,
    );
  }

  NewsDetailEntity _mapDetailResponseToEntity(NewsDetailResponse d) {
    return NewsDetailEntity(
      id: d.id,
      newsItemId: d.newsItemId,
      title: d.title,
      approveDate: d.approveDate,
      modifyDate: d.modifyDate,
      thumbnailUrl: d.thumbnailUrl,
      aiSummary: d.aiSummary,
      plainTextContent: d.plainTextContent,
      ministerCode: d.ministerCode,
      scraped: d.scraped,
      contentBlocks: d.contentBlocks.map(_mapBlock).toList()
        ..sort((a, b) => a.blockOrder.compareTo(b.blockOrder)),
    );
  }

  ContentBlockEntity _mapBlock(ContentBlockResponse b) {
    return ContentBlockEntity(
      blockType: _toBlockType(b.blockType),
      originalContent: b.originalContent,
      plainContent: b.plainContent,
      url: b.url,
      altText: b.altText,
      blockOrder: b.blockOrder,
    );
  }

  NewsBlockType _toBlockType(String raw) {
    switch (raw) {
      case 'text':
        return NewsBlockType.text;
      case 'paragraph_break':
        return NewsBlockType.paragraphBreak;
      case 'image':
        return NewsBlockType.image;
      default:
        return NewsBlockType.unknown;
    }
  }
}

// DI
final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final api = ref.watch(newsApiProvider);
  return NewsRepositoryImpl(api);
});
