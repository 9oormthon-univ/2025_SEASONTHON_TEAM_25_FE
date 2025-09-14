// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NickNameRequest _$NickNameRequestFromJson(Map<String, dynamic> json) =>
    _NickNameRequest(characterName: json['characterName'] as String);

Map<String, dynamic> _$NickNameRequestToJson(_NickNameRequest instance) =>
    <String, dynamic>{'characterName': instance.characterName};

_NickNameResponse _$NickNameResponseFromJson(Map<String, dynamic> json) =>
    _NickNameResponse(
      characterName: json['characterName'] as String,
      characterCreated: json['characterCreated'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$NickNameResponseToJson(_NickNameResponse instance) =>
    <String, dynamic>{
      'characterName': instance.characterName,
      'characterCreated': instance.characterCreated,
      'message': instance.message,
    };
