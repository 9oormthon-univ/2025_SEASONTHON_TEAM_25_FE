import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/home/data/models/home_response.dart';
import 'package:seasonthon_team_25_fe/feature/home/domain/usecases/get_home_data_usecase.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, AsyncValue<HomeResponse>>((ref) {
      final usecase = ref.watch(getHomeDataUseCaseProvider);
      return HomeController(usecase);
    });

class HomeController extends StateNotifier<AsyncValue<HomeResponse>> {
  HomeController(this._getHomeData) : super(const AsyncValue.loading());

  final GetHomeDataUseCase _getHomeData;

  Future<void> load() async {
    state = const AsyncValue.loading();
    try {
      final res = await _getHomeData();
      state = AsyncValue.data(res);
    } catch (e, st) {
      state = AsyncValue.error(mapDioError(e), st);
    }
  }
}
