import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/quest/data/models/quest_models.dart';

part 'quest_api.g.dart';

@RestApi()
abstract class QuestApi {
  factory QuestApi(Dio dio, {String baseUrl}) = _QuestApi;

  /// 현재 주차 퀘스트 조회
  /// GET /api/quests/current
  @GET('/api/quests/current')
  Future<List<QuestItem>> getCurrentQuests();

  /// 퀘스트 보상 수령
  /// POST /api/quests/{userQuestId}/claim
  @POST('/api/quests/{userQuestId}/claim')
  Future<ClaimQuestRewardResponse> claimQuestReward(
    @Path('userQuestId') int userQuestId,
  );
}

final questApiProvider = Provider<QuestApi>((ref) {
  final dio = ref.watch(dioProvider);
  return QuestApi(dio);
});
