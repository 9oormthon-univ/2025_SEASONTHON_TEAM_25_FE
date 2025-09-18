import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/feature/wallet/data/datasources/remote/wallet_remote_datasource.dart';
import 'package:seasonthon_team_25_fe/feature/wallet/data/repository_impl/wallet_repository_impl.dart';
import 'package:seasonthon_team_25_fe/feature/wallet/domain/entities/balance_entity.dart';
import 'package:seasonthon_team_25_fe/feature/wallet/domain/usecases/get_balance_usecase.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';

// Provider: DataSource
final walletRemoteDataSourceProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return WalletRemoteDataSource(dio);
});

// Provider: Repository
final walletRepositoryProvider = Provider((ref) {
  final remote = ref.watch(walletRemoteDataSourceProvider);
  return WalletRepositoryImpl(remote);
});

// Provider: UseCase
final getBalanceUseCaseProvider = Provider((ref) {
  final repo = ref.watch(walletRepositoryProvider);
  return GetBalanceUseCase(repo);
});

// StateNotifier
class WalletController extends StateNotifier<AsyncValue<BalanceEntity>> {
  WalletController(this._getBalance) : super(const AsyncValue.loading());

  final GetBalanceUseCase _getBalance;

  Future<void> fetchBalance() async {
    state = const AsyncValue.loading();
    try {
      final res = await _getBalance();
      state = AsyncValue.data(res);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// Controller Provider
final walletControllerProvider =
    StateNotifierProvider<WalletController, AsyncValue<BalanceEntity>>((ref) {
      final usecase = ref.watch(getBalanceUseCaseProvider);
      return WalletController(usecase);
    });
