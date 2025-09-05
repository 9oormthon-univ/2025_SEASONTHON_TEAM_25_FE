import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/models/onboarding_models.dart';

part 'onboarding_api.g.dart';

// retrofit interface
@RestApi()
abstract class OnboardingApi {
  factory OnboardingApi(Dio dio, {String baseUrl}) = _OnboardingApi;

  @POST('/api/onboarding/character')
  Future<void> createCharacter(@Body() CharacterRequest body);
}

final onboardingApiProvider = Provider<OnboardingApi>((ref) {
  final dio = ref.watch(dioProvider);
  return OnboardingApi(dio);
});
