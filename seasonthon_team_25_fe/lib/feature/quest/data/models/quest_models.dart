import 'package:freezed_annotation/freezed_annotation.dart';

part 'quest_models.freezed.dart';
part 'quest_models.g.dart';

/// 퀘스트 아이템 모델
@freezed
abstract class QuestItem with _$QuestItem {
  const factory QuestItem({
    required int userQuestId,
    required String title,
    required String description,
    required String periodStart,
    required String periodEnd,
    required int requirementCount,
    required int progressCount,
    required int currentStreak,
    required bool completed,
    required bool claimed,
    required double rewardAmount,
  }) = _QuestItem;

  factory QuestItem.fromJson(Map<String, dynamic> json) =>
      _$QuestItemFromJson(json);
}

/// 퀘스트 보상 수령 응답 모델
@freezed
abstract class ClaimQuestRewardResponse with _$ClaimQuestRewardResponse {
  const factory ClaimQuestRewardResponse({
    required bool completed,
    required int userQuestId,
    required String message,
  }) = _ClaimQuestRewardResponse;

  factory ClaimQuestRewardResponse.fromJson(Map<String, dynamic> json) =>
      _$ClaimQuestRewardResponseFromJson(json);
}
