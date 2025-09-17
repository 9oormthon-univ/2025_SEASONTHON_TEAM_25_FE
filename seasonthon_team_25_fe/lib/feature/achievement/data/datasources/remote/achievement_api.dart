import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/models/achievement_models.dart';

part 'achievement_api.g.dart';

@RestApi()
abstract class AchievementApi {
  factory AchievementApi(Dio dio, {String baseUrl}) = _AchievementApi;

  /// 사용자 업적 목록 조회
  /// GET /api/achievements
  @GET('/api/achievements')
  Future<AchievementListResponse> getAchievements();

  /// 업적 확인 처리
  /// POST /api/achievements/{achievementId}/claim
  @POST('/api/achievements/{achievementId}/claim')
  Future<ClaimAchievementResponse> claimAchievement(
    @Path('achievementId') int achievementId,
  );
}

final achievementApiProvider = Provider<AchievementApi>((ref) {
  final dio = ref.watch(dioProvider);
  return AchievementApi(dio);
});
