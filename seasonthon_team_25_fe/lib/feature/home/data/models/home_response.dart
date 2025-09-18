import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_response.freezed.dart';
part 'home_response.g.dart';

@freezed
abstract class HomeResponse with _$HomeResponse {
  const factory HomeResponse({
    required String characterName,
    required double balance,
    required bool attendance,
    required int quizCount,
  }) = _HomeResponse;

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}
