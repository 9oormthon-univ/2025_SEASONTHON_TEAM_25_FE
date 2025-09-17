// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) =>
    _HomeResponse(
      characterName: json['characterName'] as String,
      balance: (json['balance'] as num).toDouble(),
      attendance: json['attendance'] as bool,
      quizCount: (json['quizCount'] as num).toInt(),
    );

Map<String, dynamic> _$HomeResponseToJson(_HomeResponse instance) =>
    <String, dynamic>{
      'characterName': instance.characterName,
      'balance': instance.balance,
      'attendance': instance.attendance,
      'quizCount': instance.quizCount,
    };
