import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/data/repository_impl/savings_product_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_subscription_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/repository/savings_product_repository.dart';

class SubscribeSavingsUseCase {
  final SavingsProductRepository _repository;
  SubscribeSavingsUseCase(this._repository);

  Future<SavingsSubscriptionEntity> call(
    SavingsSubscriptionRequestEntity request,
  ) async {
    return await _repository.subscribeSavings(request);
  }
}

final subscribeSavingsUseCaseProvider = Provider<SubscribeSavingsUseCase>((ref) {
  final repository = ref.watch(savingsProductRepositoryProvider);
  return SubscribeSavingsUseCase(repository);
});
