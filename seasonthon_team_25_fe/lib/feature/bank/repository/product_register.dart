// feature/wallet/data/wallet_repository.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';

final productRegisterRepositoryProvider =
    Provider<ProductRegisterRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductRegisterRepository(dio);
});

class SubscriptionResult {
  final int subscriptionId;
  final String startDate;
  final String maturityDate;

  SubscriptionResult({
    required this.subscriptionId,
    required this.startDate,
    required this.maturityDate,
  });

  factory SubscriptionResult.fromJson(Map<String, dynamic> json) {
    return SubscriptionResult(
      subscriptionId: json['subscriptionId'] as int,
      startDate: json['startDate'] as String,
      maturityDate: json['maturityDate'] as String,
    );
  }
}

class ProductRegisterRepository {
  final Dio _dio;
  ProductRegisterRepository(this._dio);

  Future<SubscriptionResult> registerSaving({
    required int productSnapshotId,
    required int termMonths,
    required String reserveType, // "S" or "F"
    required int autoDebitAmount,
  }) async {
    final res = await _dio.post(
      '/api/savings/subscriptions',
      data: {
        "productSnapshotId": productSnapshotId,
        "termMonths": termMonths,         // 서버가 termMoonths 오타도 허용
        "reserveType": reserveType,       // "S"/"F" 또는 "FIXED"/"FREE"
        "autoDebitAmount": autoDebitAmount,
      },
    );
    return SubscriptionResult.fromJson(res.data as Map<String, dynamic>);
  }
}