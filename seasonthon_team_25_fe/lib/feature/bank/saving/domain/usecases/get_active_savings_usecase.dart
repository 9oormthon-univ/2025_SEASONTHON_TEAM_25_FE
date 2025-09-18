import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/data/repository_impl/savings_product_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/active_savings_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/repository/savings_product_repository.dart';

class GetActiveSavingsUseCase {
  final SavingsProductRepository _repository;
  GetActiveSavingsUseCase(this._repository);

  Future<ActiveSavingsListEntity> call() async {
    return await _repository.getActiveSavings();
  }
}

final getActiveSavingsUseCaseProvider = Provider<GetActiveSavingsUseCase>((ref) {
  final repository = ref.watch(savingsProductRepositoryProvider);
  return GetActiveSavingsUseCase(repository);
});

