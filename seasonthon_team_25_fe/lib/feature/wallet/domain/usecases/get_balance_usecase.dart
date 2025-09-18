import 'package:seasonthon_team_25_fe/feature/wallet/domain/entities/balance_entity.dart';
import 'package:seasonthon_team_25_fe/feature/wallet/domain/repository/wallet_repository.dart';

class GetBalanceUseCase {
  final WalletRepository repository;
  GetBalanceUseCase(this.repository);

  Future<BalanceEntity> call() {
    return repository.getBalance();
  }
}
