import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/quest/data/models/quest_models.dart';
import 'package:seasonthon_team_25_fe/feature/quest/domain/usecases/claim_quest_reward_usecase.dart';
import 'package:seasonthon_team_25_fe/feature/quest/domain/usecases/get_current_quests_usecase.dart';

/// 퀘스트 상태 모델
class QuestState {
  final bool isLoading;
  final bool isClaimingReward;
  final String? error;
  final List<QuestItem> quests;
  final Set<int> claimingQuestIds; // 현재 보상 수령 중인 퀘스트 ID들

  const QuestState({
    this.isLoading = false,
    this.isClaimingReward = false,
    this.error,
    this.quests = const [],
    this.claimingQuestIds = const {},
  });

  QuestState copyWith({
    bool? isLoading,
    bool? isClaimingReward,
    String? error,
    List<QuestItem>? quests,
    Set<int>? claimingQuestIds,
  }) {
    return QuestState(
      isLoading: isLoading ?? this.isLoading,
      isClaimingReward: isClaimingReward ?? this.isClaimingReward,
      error: error,
      quests: quests ?? this.quests,
      claimingQuestIds: claimingQuestIds ?? this.claimingQuestIds,
    );
  }
}

final questControllerProvider =
    StateNotifierProvider<QuestController, QuestState>((ref) {
  final getCurrentQuestsUseCase = ref.watch(getCurrentQuestsUseCaseProvider);
  final claimRewardUseCase = ref.watch(claimQuestRewardUseCaseProvider);
  return QuestController(getCurrentQuestsUseCase, claimRewardUseCase);
});

class QuestController extends StateNotifier<QuestState> {
  QuestController(
    this._getCurrentQuestsUseCase,
    this._claimQuestRewardUseCase,
  ) : super(const QuestState());

  final GetCurrentQuestsUseCase _getCurrentQuestsUseCase;
  final ClaimQuestRewardUseCase _claimQuestRewardUseCase;

  /// 현재 주차 퀘스트 목록 조회
  Future<void> loadCurrentQuests() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final quests = await _getCurrentQuestsUseCase();
      
      state = state.copyWith(
        isLoading: false,
        quests: quests,
      );
    } catch (e, st) {
      state = state.copyWith(
        isLoading: false,
        error: mapDioError(e),
      );
    }
  }

  /// 퀘스트 보상 수령
  Future<ClaimQuestRewardResponse?> claimQuestReward(int userQuestId) async {
    // 이미 수령 중인 퀘스트인지 확인
    if (state.claimingQuestIds.contains(userQuestId)) {
      return null;
    }

    final updatedClaimingIds = Set<int>.from(state.claimingQuestIds);
    updatedClaimingIds.add(userQuestId);
    
    state = state.copyWith(
      claimingQuestIds: updatedClaimingIds,
      error: null,
    );
    
    try {
      final response = await _claimQuestRewardUseCase(userQuestId);
      
      // 성공적으로 보상을 수령한 경우에만 상태 업데이트
      if (response.completed) {
        // 퀘스트 목록에서 해당 퀘스트의 claimed 상태 업데이트
        final updatedQuests = state.quests.map((quest) {
          if (quest.userQuestId == userQuestId) {
            return quest.copyWith(claimed: true);
          }
          return quest;
        }).toList();
        
        state = state.copyWith(quests: updatedQuests);
      }
      
      final finalClaimingIds = Set<int>.from(state.claimingQuestIds);
      finalClaimingIds.remove(userQuestId);
      
      state = state.copyWith(claimingQuestIds: finalClaimingIds);
      
      return response;
    } catch (e, st) {
      final finalClaimingIds = Set<int>.from(state.claimingQuestIds);
      finalClaimingIds.remove(userQuestId);
      
      state = state.copyWith(
        claimingQuestIds: finalClaimingIds,
        error: mapDioError(e),
      );
      return null;
    }
  }

  /// 특정 퀘스트가 보상 수령 중인지 확인
  bool isClaimingReward(int userQuestId) {
    return state.claimingQuestIds.contains(userQuestId);
  }

  /// 에러 초기화
  void clearError() {
    state = state.copyWith(error: null);
  }
}
