// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestItem _$QuestItemFromJson(Map<String, dynamic> json) => _QuestItem(
  userQuestId: (json['userQuestId'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  periodStart: json['periodStart'] as String,
  periodEnd: json['periodEnd'] as String,
  requirementCount: (json['requirementCount'] as num).toInt(),
  progressCount: (json['progressCount'] as num).toInt(),
  currentStreak: (json['currentStreak'] as num).toInt(),
  completed: json['completed'] as bool,
  claimed: json['claimed'] as bool,
  rewardAmount: (json['rewardAmount'] as num).toDouble(),
);

Map<String, dynamic> _$QuestItemToJson(_QuestItem instance) =>
    <String, dynamic>{
      'userQuestId': instance.userQuestId,
      'title': instance.title,
      'description': instance.description,
      'periodStart': instance.periodStart,
      'periodEnd': instance.periodEnd,
      'requirementCount': instance.requirementCount,
      'progressCount': instance.progressCount,
      'currentStreak': instance.currentStreak,
      'completed': instance.completed,
      'claimed': instance.claimed,
      'rewardAmount': instance.rewardAmount,
    };

_ClaimQuestRewardResponse _$ClaimQuestRewardResponseFromJson(
  Map<String, dynamic> json,
) => _ClaimQuestRewardResponse(
  completed: json['completed'] as bool,
  userQuestId: (json['userQuestId'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$ClaimQuestRewardResponseToJson(
  _ClaimQuestRewardResponse instance,
) => <String, dynamic>{
  'completed': instance.completed,
  'userQuestId': instance.userQuestId,
  'message': instance.message,
};
