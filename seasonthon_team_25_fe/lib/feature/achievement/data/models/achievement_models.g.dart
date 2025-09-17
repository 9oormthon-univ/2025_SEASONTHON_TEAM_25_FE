// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AchievementItem _$AchievementItemFromJson(Map<String, dynamic> json) =>
    _AchievementItem(
      achievementId: (json['achievementId'] as num).toInt(),
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      iconUrl: json['iconUrl'] as String,
      requirementCount: (json['requirementCount'] as num).toInt(),
      claimed: json['claimed'] as bool,
    );

Map<String, dynamic> _$AchievementItemToJson(_AchievementItem instance) =>
    <String, dynamic>{
      'achievementId': instance.achievementId,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'requirementCount': instance.requirementCount,
      'claimed': instance.claimed,
    };

_AchievementListResponse _$AchievementListResponseFromJson(
  Map<String, dynamic> json,
) => _AchievementListResponse(
  achievements: (json['achievements'] as List<dynamic>)
      .map((e) => AchievementItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AchievementListResponseToJson(
  _AchievementListResponse instance,
) => <String, dynamic>{'achievements': instance.achievements};

_ClaimAchievementResponse _$ClaimAchievementResponseFromJson(
  Map<String, dynamic> json,
) => _ClaimAchievementResponse(
  achievementId: (json['achievementId'] as num).toInt(),
  type: json['type'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  iconUrl: json['iconUrl'] as String,
  claimed: json['claimed'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$ClaimAchievementResponseToJson(
  _ClaimAchievementResponse instance,
) => <String, dynamic>{
  'achievementId': instance.achievementId,
  'type': instance.type,
  'title': instance.title,
  'description': instance.description,
  'iconUrl': instance.iconUrl,
  'claimed': instance.claimed,
  'message': instance.message,
};
