import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/data/repository_impl/savings_product_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_detail_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/repository/savings_product_repository.dart';

class GetSavingsProductDetailUseCase {
  final SavingsProductRepository _repository;
  GetSavingsProductDetailUseCase(this._repository);

  Future<SavingsProductDetailEntity> call(int productId) async {
    return await _repository.getSavingsProductDetail(productId);
  }
}

final getSavingsProductDetailUseCaseProvider = Provider<GetSavingsProductDetailUseCase>((ref) {
  final repository = ref.watch(savingsProductRepositoryProvider);
  return GetSavingsProductDetailUseCase(repository);
});



