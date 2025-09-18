// 폴더 이동 고려

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/home/domain/usecases/get_home_data_usecase.dart';

final coinProvider = StateNotifierProvider<CoinController, AsyncValue<double>>((
  ref,
) {
  final usecase = ref.watch(getHomeDataUseCaseProvider);
  return CoinController(usecase);
});

class CoinController extends StateNotifier<AsyncValue<double>> {
  CoinController(this._getHomeData) : super(const AsyncValue.loading());

  final GetHomeDataUseCase _getHomeData;

  Future<void> loadBalance() async {
    state = const AsyncValue.loading();
    try {
      final res = await _getHomeData();
      state = AsyncValue.data(res.balance);
    } catch (e, st) {
      state = AsyncValue.error(mapDioError(e), st);
    }
  }
}
