import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/news/data/models/news_detail_models.dart';
import 'package:seasonthon_team_25_fe/feature/news/data/models/news_models.dart';

part 'news_api.g.dart';

@RestApi()
abstract class NewsApi {
  factory NewsApi(Dio dio, {String baseUrl}) = _NewsApi;

  /// GET /api/news?page=0&size=10
  @GET('/api/news')
  Future<NewsPageResponse> fetchNews(
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET('/api/news/{id}')
  Future<NewsDetailResponse> fetchNewsDetail(@Path('id') int id);
  
}

final newsApiProvider = Provider<NewsApi>((ref) {
  final dio = ref.watch(dioProvider);
  return NewsApi(dio);
});
