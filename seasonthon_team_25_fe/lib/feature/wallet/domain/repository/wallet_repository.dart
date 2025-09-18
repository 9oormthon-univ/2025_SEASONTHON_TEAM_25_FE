import 'package:seasonthon_team_25_fe/feature/wallet/domain/entities/balance_entity.dart';

abstract class WalletRepository {
  Future<BalanceEntity> getBalance();
}
