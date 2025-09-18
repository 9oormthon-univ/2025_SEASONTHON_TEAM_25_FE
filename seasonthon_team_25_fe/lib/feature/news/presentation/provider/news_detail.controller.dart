import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/entities/new_detail_entity.dart';
import 'package:seasonthon_team_25_fe/feature/news/domain/usecases/news_usecase.dart';

class NewsDetailState {
  final AsyncValue<NewsDetailEntity?> detail;

  const NewsDetailState({this.detail = const AsyncValue.data(null)});

  NewsDetailState copyWith({AsyncValue<NewsDetailEntity?>? detail}) =>
      NewsDetailState(detail: detail ?? this.detail);
}

class NewsDetailController extends StateNotifier<NewsDetailState> {
  final NewsUsecase _usecase;
  NewsDetailController(this._usecase) : super(const NewsDetailState());

  Future<void> load(int id) async {
    state = state.copyWith(detail: const AsyncValue.loading());
    try {
      final res = await _usecase.fetchDetail(id);
      state = state.copyWith(detail: AsyncValue.data(res));
    } catch (e, st) {
      state = state.copyWith(detail: AsyncValue.error(e, st));
    }
  }

  void clear() => state = const NewsDetailState();
}

final newsDetailControllerProvider =
    StateNotifierProvider<NewsDetailController, NewsDetailState>((ref) {
      final uc = ref.watch(newsUsecaseProvider);
      return NewsDetailController(uc);
    });
