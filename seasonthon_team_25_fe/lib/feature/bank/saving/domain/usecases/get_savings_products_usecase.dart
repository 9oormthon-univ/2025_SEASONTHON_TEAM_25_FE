import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/data/repository_impl/savings_product_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_list_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/repository/savings_product_repository.dart';

class GetSavingsProductsUseCase {
  final SavingsProductRepository _repo;
  GetSavingsProductsUseCase(this._repo);

  Future<SavingsProductListEntity> call({
    String type = "SAVING",
    String sort = "name",
    String? banks,
  }) {
    return _repo.getSavingsProducts(type: type, sort: sort, banks: banks);
  }
}

final getSavingsProductsUseCaseProvider =
    Provider<GetSavingsProductsUseCase>((ref) {
  final repo = ref.watch(savingsProductRepositoryProvider);
  return GetSavingsProductsUseCase(repo);
});
