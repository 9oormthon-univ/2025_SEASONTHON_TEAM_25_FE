import 'package:seasonthon_team_25_fe/feature/scrap/data/models/scrap_models.dart';

abstract class ScrapRepository {
  /// 뉴스 스크랩 등록/해제
  Future<ScrapResponse> toggleNewsScrap(int newsArticleId);

  /// 뉴스 스크랩 목록 조회
  Future<ScrapNewsPageResponse> getScrapNews({
    int page = 0,
    int size = 20,
    String sort = 'scrappedDate,desc',
  });
}
