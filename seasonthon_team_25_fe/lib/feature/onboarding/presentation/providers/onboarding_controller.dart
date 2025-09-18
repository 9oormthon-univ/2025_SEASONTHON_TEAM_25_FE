import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/domain/entities/nick_name_entity.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/domain/usecases/onboarding_usecase.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/datasources/local/nickname_storage_prefs.dart';

// 화면에서 사용할 온보딩 상태
class OnboardingState {
  // 닉네임 생성 API 상태
  final AsyncValue<NickNameEntity?> createName;

  // 로컬(SharedPreferences)에 닉네임이 저장되어 있는지
  final bool savedLocally;

  const OnboardingState({
    this.createName = const AsyncValue.data(null),
    this.savedLocally = false,
  });

  OnboardingState copyWith({
    AsyncValue<NickNameEntity?>? createName,
    bool? savedLocally,
  }) => OnboardingState(
    createName: createName ?? this.createName,
    savedLocally: savedLocally ?? this.savedLocally,
  );
}

class OnboardingController extends StateNotifier<OnboardingState> {
  final OnboardingUsecase _usecase;
  final NicknameStorage _nicknameStorage;

  OnboardingController(this._usecase, this._nicknameStorage)
    : super(const OnboardingState());

  // 닉네임 생성 요청 → 성공 시 로컬에 저장 → 저장 성공 여부까지 state에 반영
  Future<void> createNickName(String rawName) async {
    final name = rawName.trim();
    state = state.copyWith(
      createName: const AsyncValue.loading(),
      savedLocally: false,
    );

    try {
      final res = await _usecase.createNickName(name);

      // 로컬 저장 (덮어쓰기 허용) + 검증
      bool saved = false;
      final incoming = res.characterName.trim();
      if (incoming.isNotEmpty) {
        await _nicknameStorage.saveNickname(incoming);
        saved = _nicknameStorage.getNickname() == incoming;
      }

      state = state.copyWith(
        createName: AsyncValue.data(res),
        savedLocally: saved,
      );
    } catch (e, st) {
      state = state.copyWith(
        createName: AsyncValue.error(e, st),
        savedLocally: false,
      );
    }
  }

  /// 상태 초기화 (다시 시도 등)
  void reset() => state = const OnboardingState();
}

final onboardingControllerProvider =
    StateNotifierProvider<OnboardingController, OnboardingState>((ref) {
      final usecase = ref.watch(onboardingUsecaseProvider);
      final nick = ref.watch(nicknameStorageProvider);
      return OnboardingController(usecase, nick);
    });
