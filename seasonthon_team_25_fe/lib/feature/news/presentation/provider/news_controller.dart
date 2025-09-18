import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_item_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/news_page_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/usecases/news_usecase.dart';

class NewsState {
  /// 최초 페이지 로딩 상태(성공 시 page 정보 포함)
  final AsyncValue<NewsPageEntity?> page;

  /// 누적 아이템(무한 스크롤용)
  final List<NewsItemEntity> items;

  /// 현재 페이지 번호(0부터)
  final int pageNumber;

  /// 마지막 페이지 여부
  final bool last;

  /// 추가 로딩 중 여부(중복 호출 방지)
  final bool isLoadingMore;

  const NewsState({
    this.page = const AsyncValue.data(null),
    this.items = const [],
    this.pageNumber = 0,
    this.last = false,
    this.isLoadingMore = false,
  });

  NewsState copyWith({
    AsyncValue<NewsPageEntity?>? page,
    List<NewsItemEntity>? items,
    int? pageNumber,
    bool? last,
    bool? isLoadingMore,
  }) {
    return NewsState(
      page: page ?? this.page,
      items: items ?? this.items,
      pageNumber: pageNumber ?? this.pageNumber,
      last: last ?? this.last,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class NewsController extends StateNotifier<NewsState> {
  final NewsUsecase _usecase;
  NewsController(this._usecase) : super(const NewsState());

  /// 최초 로드/새로고침
  Future<void> loadFirst({int size = 10}) async {
    state = state.copyWith(page: const AsyncValue.loading());
    try {
      final res = await _usecase.fetchPage(page: 0, size: size);
      state = state.copyWith(
        page: AsyncValue.data(res),
        items: res.items,
        pageNumber: 0,
        last: res.last,
      );
    } catch (e, st) {
      state = state.copyWith(page: AsyncValue.error(e, st));
    }
  }

  /// 다음 페이지 로드(무한 스크롤)
  Future<void> loadMore({int size = 10}) async {
    if (state.isLoadingMore || state.last) return;
    state = state.copyWith(isLoadingMore: true);
    try {
      final nextPage = state.pageNumber + 1;
      final res = await _usecase.fetchPage(page: nextPage, size: size);
      state = state.copyWith(
        items: [...state.items, ...res.items],
        pageNumber: nextPage,
        last: res.last,
        isLoadingMore: false,
      );
    } catch (e, st) {
      // 추가 로딩 실패 시, 기존 목록은 유지하되 플래그만 내려주기
      state = state.copyWith(isLoadingMore: false);
      // 필요하면 별도의 에러 상태 필드 추가 가능
    }
  }

  /// 간단 리스트(첫 페이지만 필요할 때) — UI에서 바로 items만 쓰고 싶으면 사용
  Future<void> loadSimple({int size = 10}) async {
    state = state.copyWith(page: const AsyncValue.loading());
    try {
      final list = await _usecase.fetchFirstList(size: size);
      state = state.copyWith(
        page: const AsyncValue.data(null),
        items: list,
        pageNumber: 0,
        last: true, // 단순 목록 모드에선 더 불러오지 않음
      );
    } catch (e, st) {
      state = state.copyWith(page: AsyncValue.error(e, st));
    }
  }

  void clear() => state = const NewsState();
}

/// DI
final newsControllerProvider = StateNotifierProvider<NewsController, NewsState>(
  (ref) {
    final uc = ref.watch(newsUsecaseProvider);
    return NewsController(uc);
  },
);
