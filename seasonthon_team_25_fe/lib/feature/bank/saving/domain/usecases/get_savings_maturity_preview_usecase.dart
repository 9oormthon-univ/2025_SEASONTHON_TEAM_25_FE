import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/data/repository_impl/savings_product_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_maturity_preview_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/repository/savings_product_repository.dart';

class GetSavingsMaturityPreviewUseCase {
  final SavingsProductRepository _repository;
  GetSavingsMaturityPreviewUseCase(this._repository);

  Future<SavingsMaturityPreviewEntity> call(
    int productId, {
    required int monthlyAmount,
    required int termMonths,
  }) async {
    return await _repository.getSavingsMaturityPreview(
      productId,
      monthlyAmount: monthlyAmount,
      termMonths: termMonths,
    );
  }
}

final getSavingsMaturityPreviewUseCaseProvider = Provider<GetSavingsMaturityPreviewUseCase>((ref) {
  final repository = ref.watch(savingsProductRepositoryProvider);
  return GetSavingsMaturityPreviewUseCase(repository);
});



