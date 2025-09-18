import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/active_savings_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/usecases/get_active_savings_usecase.dart';

final activeSavingsControllerProvider =
    StateNotifierProvider<ActiveSavingsController, AsyncValue<ActiveSavingsListEntity>>((ref) {
  final usecase = ref.watch(getActiveSavingsUseCaseProvider);
  return ActiveSavingsController(usecase);
});

class ActiveSavingsController extends StateNotifier<AsyncValue<ActiveSavingsListEntity>> {
  ActiveSavingsController(this._getActiveSavings) : super(const AsyncValue.loading());

  final GetActiveSavingsUseCase _getActiveSavings;

  Future<void> load() async {
    state = const AsyncValue.loading();
    try {
      final res = await _getActiveSavings();
      state = AsyncValue.data(res);
    } catch (e) {
      state = AsyncValue.error(mapDioError(e), StackTrace.current);
    }
  }
}
