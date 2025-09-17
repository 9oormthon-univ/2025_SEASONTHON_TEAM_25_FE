import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_list_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/usecases/get_savings_products_usecase.dart';

final savingsProductControllerProvider =
    StateNotifierProvider<SavingsProductController,
        AsyncValue<SavingsProductListEntity>>((ref) {
  final usecase = ref.watch(getSavingsProductsUseCaseProvider);
  return SavingsProductController(usecase);
});

class SavingsProductController
    extends StateNotifier<AsyncValue<SavingsProductListEntity>> {
  SavingsProductController(this._getSavingsProducts)
      : super(const AsyncValue.loading());

  final GetSavingsProductsUseCase _getSavingsProducts;

  Future<void> load({
    String type = "SAVING",
    String sort = "name",
    String? banks,
  }) async {
    state = const AsyncValue.loading();
    try {
      final res =
          await _getSavingsProducts(type: type, sort: sort, banks: banks);
      state = AsyncValue.data(res);
    } catch (e, st) {
      state = AsyncValue.error(mapDioError(e), st);
    }
  }
}
