import 'package:seasonthon_team_25_fe/feature/wallet/data/datasources/remote/wallet_remote_datasource.dart';
import 'package:seasonthon_team_25_fe/feature/wallet/data/models/balance_model.dart'; // 🔹 추가
import 'package:seasonthon_team_25_fe/feature/wallet/domain/entities/balance_entity.dart';
import 'package:seasonthon_team_25_fe/feature/wallet/domain/repository/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  final WalletRemoteDataSource remote;

  WalletRepositoryImpl(this.remote);

  @override
  Future<BalanceEntity> getBalance() async {
    final model = await remote.getBalance();
    return model.toEntity();
  }
}
