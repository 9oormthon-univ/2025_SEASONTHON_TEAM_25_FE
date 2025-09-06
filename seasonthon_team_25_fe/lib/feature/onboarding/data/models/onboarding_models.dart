import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding_models.freezed.dart';
part 'onboarding_models.g.dart';

@freezed
abstract class CharacterRequest with _$CharacterRequest {
  const factory CharacterRequest({required String characterName}) =
      _CharacterRequest;

  factory CharacterRequest.fromJson(Map<String, dynamic> json) =>
      _$CharacterRequestFromJson(json);
}
