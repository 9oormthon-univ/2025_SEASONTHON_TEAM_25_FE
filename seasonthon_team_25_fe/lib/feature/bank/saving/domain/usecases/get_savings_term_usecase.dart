import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/data/repository_impl/savings_product_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_term_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/repository/savings_product_repository.dart';

class GetSavingsTermUseCase {
  final SavingsProductRepository _repository;
  GetSavingsTermUseCase(this._repository);

  Future<SavingsTermEntity> call(String termName) async {
    return await _repository.getSavingsTerm(termName);
  }
}

final getSavingsTermUseCaseProvider = Provider<GetSavingsTermUseCase>((ref) {
  final repository = ref.watch(savingsProductRepositoryProvider);
  return GetSavingsTermUseCase(repository);
});
