import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/data/models/scrap_models.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/domain/usecases/get_scrap_news_usecase.dart';
import 'package:seasonthon_team_25_fe/feature/scrap/domain/usecases/toggle_news_scrap_usecase.dart';

/// 스크랩 상태 모델
class ScrapState {
  final bool isLoading;
  final bool isLoadingList;
  final String? error;
  final Map<int, bool> scrapStatus; // newsId -> isScraped
  final ScrapNewsPageResponse? scrapNewsPage;

  const ScrapState({
    this.isLoading = false,
    this.isLoadingList = false,
    this.error,
    this.scrapStatus = const {},
    this.scrapNewsPage,
  });

  ScrapState copyWith({
    bool? isLoading,
    bool? isLoadingList,
    String? error,
    Map<int, bool>? scrapStatus,
    ScrapNewsPageResponse? scrapNewsPage,
  }) {
    return ScrapState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingList: isLoadingList ?? this.isLoadingList,
      error: error,
      scrapStatus: scrapStatus ?? this.scrapStatus,
      scrapNewsPage: scrapNewsPage ?? this.scrapNewsPage,
    );
  }
}

final scrapControllerProvider =
    StateNotifierProvider<ScrapController, ScrapState>((ref) {
  final toggleUseCase = ref.watch(toggleNewsScrapUseCaseProvider);
  final getScrapNewsUseCase = ref.watch(getScrapNewsUseCaseProvider);
  return ScrapController(toggleUseCase, getScrapNewsUseCase);
});

class ScrapController extends StateNotifier<ScrapState> {
  ScrapController(
    this._toggleNewsScrapUseCase,
    this._getScrapNewsUseCase,
  ) : super(const ScrapState());

  final ToggleNewsScrapUseCase _toggleNewsScrapUseCase;
  final GetScrapNewsUseCase _getScrapNewsUseCase;

  /// 뉴스 스크랩 토글
  Future<ScrapResponse?> toggleNewsScrap(int newsArticleId) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final response = await _toggleNewsScrapUseCase(newsArticleId);
      
      // 스크랩 상태 업데이트
      final updatedStatus = Map<int, bool>.from(state.scrapStatus);
      updatedStatus[newsArticleId] = response.scraped;
      
      state = state.copyWith(
        isLoading: false,
        scrapStatus: updatedStatus,
      );
      
      return response;
    } catch (e, st) {
      state = state.copyWith(
        isLoading: false,
        error: mapDioError(e),
      );
      return null;
    }
  }

  /// 특정 뉴스의 스크랩 상태 조회
  bool isNewsScraped(int newsArticleId) {
    return state.scrapStatus[newsArticleId] ?? false;
  }

  /// 스크랩 상태 초기화
  void setNewsScrapStatus(int newsArticleId, bool isScraped) {
    final updatedStatus = Map<int, bool>.from(state.scrapStatus);
    updatedStatus[newsArticleId] = isScraped;
    state = state.copyWith(scrapStatus: updatedStatus);
  }

  /// 스크랩된 뉴스 목록 조회
  Future<void> loadScrapNews({
    int page = 0,
    int size = 20,
    String sort = 'scrappedDate,desc',
  }) async {
    state = state.copyWith(isLoadingList: true, error: null);
    
    try {
      final response = await _getScrapNewsUseCase(
        page: page,
        size: size,
        sort: sort,
      );
      
      // 스크랩 상태 업데이트
      final updatedStatus = Map<int, bool>.from(state.scrapStatus);
      for (final item in response.content) {
        updatedStatus[item.newsArticleId] = item.scraped;
      }
      
      state = state.copyWith(
        isLoadingList: false,
        scrapNewsPage: response,
        scrapStatus: updatedStatus,
      );
    } catch (e, st) {
      state = state.copyWith(
        isLoadingList: false,
        error: mapDioError(e),
      );
    }
  }

  /// 더 많은 스크랩 뉴스 로드 (페이징)
  Future<void> loadMoreScrapNews() async {
    final currentPage = state.scrapNewsPage;
    if (currentPage == null || !currentPage.hasNext || state.isLoadingList) {
      return;
    }

    await loadScrapNews(
      page: currentPage.page + 1,
      size: currentPage.size,
    );
  }

  /// 에러 초기화
  void clearError() {
    state = state.copyWith(error: null);
  }
}
