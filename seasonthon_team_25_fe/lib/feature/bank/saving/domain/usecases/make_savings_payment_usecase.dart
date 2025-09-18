import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/data/repository_impl/savings_product_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_payment_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/repository/savings_product_repository.dart';

class MakeSavingsPaymentUseCase {
  final SavingsProductRepository _repository;
  MakeSavingsPaymentUseCase(this._repository);

  Future<SavingsPaymentEntity> call(int subscriptionId) async {
    return await _repository.makePayment(subscriptionId);
  }
}

final makeSavingsPaymentUseCaseProvider = Provider<MakeSavingsPaymentUseCase>((ref) {
  final repository = ref.watch(savingsProductRepositoryProvider);
  return MakeSavingsPaymentUseCase(repository);
});
