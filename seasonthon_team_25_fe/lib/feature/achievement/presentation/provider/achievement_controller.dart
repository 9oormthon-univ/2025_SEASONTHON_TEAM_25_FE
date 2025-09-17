import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/data/models/achievement_models.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/domain/usecases/get_achievements_usecase.dart';
import 'package:seasonthon_team_25_fe/feature/achievement/domain/usecases/claim_achievement_usecase.dart';

/// 업적 상태 모델
class AchievementState {
  final bool isLoading;
  final String? error;
  final List<AchievementItem> achievements;
  final bool isClaimingAchievement;

  const AchievementState({
    this.isLoading = false,
    this.error,
    this.achievements = const [],
    this.isClaimingAchievement = false,
  });

  AchievementState copyWith({
    bool? isLoading,
    String? error,
    List<AchievementItem>? achievements,
    bool? isClaimingAchievement,
  }) {
    return AchievementState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      achievements: achievements ?? this.achievements,
      isClaimingAchievement: isClaimingAchievement ?? this.isClaimingAchievement,
    );
  }
}

final achievementControllerProvider =
    StateNotifierProvider<AchievementController, AchievementState>((ref) {
  final getAchievementsUseCase = ref.watch(getAchievementsUseCaseProvider);
  final claimAchievementUseCase = ref.watch(claimAchievementUseCaseProvider);
  return AchievementController(getAchievementsUseCase, claimAchievementUseCase);
});

class AchievementController extends StateNotifier<AchievementState> {
  AchievementController(this._getAchievementsUseCase, this._claimAchievementUseCase) : super(const AchievementState());

  final GetAchievementsUseCase _getAchievementsUseCase;
  final ClaimAchievementUseCase _claimAchievementUseCase;

  /// 업적 목록 조회
  Future<void> loadAchievements() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final response = await _getAchievementsUseCase();
      
      state = state.copyWith(
        isLoading: false,
        achievements: response.achievements,
      );
    } catch (e, st) {
      state = state.copyWith(
        isLoading: false,
        error: mapDioError(e),
      );
    }
  }

  /// 업적 확인 처리
  Future<String?> claimAchievement(int achievementId) async {
    if (state.isClaimingAchievement) return null;
    
    state = state.copyWith(isClaimingAchievement: true, error: null);
    
    try {
      final response = await _claimAchievementUseCase(achievementId);
      
      // 업적 목록에서 해당 업적의 claimed 상태를 업데이트
      final updatedAchievements = state.achievements.map((achievement) {
        if (achievement.achievementId == achievementId) {
          return achievement.copyWith(claimed: true);
        }
        return achievement;
      }).toList();
      
      state = state.copyWith(
        isClaimingAchievement: false,
        achievements: updatedAchievements,
      );
      
      return response.message;
    } catch (e, st) {
      state = state.copyWith(
        isClaimingAchievement: false,
        error: mapDioError(e),
      );
      return null;
    }
  }

  /// 에러 초기화
  void clearError() {
    state = state.copyWith(error: null);
  }
}
