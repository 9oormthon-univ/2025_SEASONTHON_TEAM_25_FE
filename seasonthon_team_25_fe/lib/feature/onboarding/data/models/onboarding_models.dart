import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding_models.freezed.dart';
part 'onboarding_models.g.dart';

@freezed
abstract class NickNameRequest with _$NickNameRequest {
  @JsonSerializable(explicitToJson: true)
  const factory NickNameRequest({required String characterName}) =
      _NickNameRequest;

  factory NickNameRequest.fromJson(Map<String, dynamic> json) =>
      _$NickNameRequestFromJson(json);
}

@freezed
abstract class NickNameResponse with _$NickNameResponse {
  @JsonSerializable(explicitToJson: true)
  const factory NickNameResponse({
    required String characterName,
    required bool characterCreated,
    String? message,
  }) = _NickNameResponse;

  factory NickNameResponse.fromJson(Map<String, dynamic> json) =>
      _$NickNameResponseFromJson(json);
}
