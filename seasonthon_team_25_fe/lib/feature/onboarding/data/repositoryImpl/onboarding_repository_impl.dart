import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/datasources/local/nickname_storage_prefs.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/datasources/remote/onboarding_api.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/models/onboarding_models.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/domain/entities/nick_name_entity.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingApi _remote;
  final NicknameStorage _nicknameStorage;

  OnboardingRepositoryImpl(this._remote, this._nicknameStorage);

  @override
  Future<NickNameEntity> createName(String characterName) async {
    try {
      final res = await _remote.createNickName(
        NickNameRequest(characterName: characterName),
      );

      // 성공 시 로컬에 닉네임 저장(덮어쓰기 허용)
      final incoming = res.characterName.trim();
      if (incoming.isNotEmpty) {
        await _nicknameStorage.saveNickname(incoming);
      }

      return NickNameEntity(
        characterName: res.characterName,
        characterCreated: res.characterCreated,
        message: res.message,
      );
    } catch (e) {
      // 서버가 내려주는 code/message/validation은 mapDioError에서 가공
      throw Exception(mapDioError(e));
    }
  }
}

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  final api = ref.read(onboardingApiProvider);
  final nicknameStorage = ref.read(nicknameStorageProvider);
  return OnboardingRepositoryImpl(api, nicknameStorage);
});
