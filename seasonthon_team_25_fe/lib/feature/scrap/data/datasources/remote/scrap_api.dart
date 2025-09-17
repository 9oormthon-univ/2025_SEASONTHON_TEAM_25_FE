import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/models/scrap_models.dart';

part 'scrap_api.g.dart';

@RestApi()
abstract class ScrapApi {
  factory ScrapApi(Dio dio, {String baseUrl}) = _ScrapApi;

  /// 뉴스 스크랩 등록/해제
  /// POST /api/scrap/news/{newsArticleId}
  @POST('/api/scrap/news/{newsArticleId}')
  Future<ScrapResponse> toggleNewsScrap(
    @Path('newsArticleId') int newsArticleId,
  );

  /// 뉴스 스크랩 목록 조회
  /// GET /api/scrap/news
  @GET('/api/scrap/news')
  Future<ScrapNewsPageResponse> getScrapNews({
    @Query('page') int page = 0,
    @Query('size') int size = 20,
    @Query('sort') String sort = 'scrappedDate,desc',
  });

  /// 퀴즈 스크랩 등록/해제
  /// POST /api/scrap/quiz
  @POST('/api/scrap/quiz')
  Future<QuizScrapResponse> toggleQuizScrap(
    @Body() QuizScrapRequest request,
  );

  /// 퀴즈 스크랩 목록 조회
  /// GET /api/scrap/quiz
  @GET('/api/scrap/quiz')
  Future<ScrapQuizPageResponse> getScrapQuiz({
    @Query('page') int page = 0,
    @Query('size') int size = 20,
    @Query('sort') String sort = 'scrappedDate,desc',
  });
}

final scrapApiProvider = Provider<ScrapApi>((ref) {
  final dio = ref.watch(dioProvider);
  return ScrapApi(dio);
});
