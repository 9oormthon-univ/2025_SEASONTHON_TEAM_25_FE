import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/datasources/remote/onboarding_api.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/models/onboarding_models.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingApi _remote;

  OnboardingRepositoryImpl(this._remote);

  @override
  Future<void> createCharacter({required String characterName}) async {
    try {
      await _remote.createCharacter(
        CharacterRequest(characterName: characterName),
      ); // 2xx면 들어옴
    } catch (e) {
      // 4xx/5xx → DioException → 사람이 읽을 메시지로 변환 후 throw
      throw Exception(mapDioError(e));
    }
  }
}

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  final api = ref.read(onboardingApiProvider);
  return OnboardingRepositoryImpl(api);
});
