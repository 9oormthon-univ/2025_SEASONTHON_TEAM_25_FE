import 'package:dio/dio.dart';
import 'package:seasonthon_team_25_fe/feature/wallet/data/models/balance_model.dart';

class WalletRemoteDataSource {
  final Dio _dio;
  WalletRemoteDataSource(this._dio);

  Future<BalanceModel> getBalance() async {
    final response = await _dio.get('/api/wallet/balance');
    return BalanceModel.fromJson(response.data);
  }
}
