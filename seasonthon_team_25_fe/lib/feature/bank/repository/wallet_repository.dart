// feature/wallet/data/wallet_repository.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';

final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return WalletRepository(dio);
});

class WalletRepository {
  final Dio _dio;
  WalletRepository(this._dio);

  Future<int> fetchBalance() async {
    final res = await _dio.get('/api/wallet/balance');
    return res.data['balance'] as int;
  }
}