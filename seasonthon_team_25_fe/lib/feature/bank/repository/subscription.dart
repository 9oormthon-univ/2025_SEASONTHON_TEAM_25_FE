import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';

/// ===== 진행 중인 적금 모델 =====
class ActiveSubscription {
  final int subscriptionId;
  final String productName;
  final int currentAmount;
  final int progressPercentage;
  final String joinDate;
  final String maturityDate;
  final int remainingPayments;

  ActiveSubscription({
    required this.subscriptionId,
    required this.productName,
    required this.currentAmount,
    required this.progressPercentage,
    required this.joinDate,
    required this.maturityDate,
    required this.remainingPayments,
  });

  factory ActiveSubscription.fromJson(Map<String, dynamic> json) {
    return ActiveSubscription(
      subscriptionId: json['subscriptionId'] as int,
      productName: json['productName'] as String,
      currentAmount: json['currentAmount'] as int,
      progressPercentage: json['progressPercentage'] as int,
      joinDate: json['joinDate'] as String,
      maturityDate: json['maturityDate'] as String,
      remainingPayments: json['remainingPayments'] as int,
    );
  }
}

/// ===== 레포지토리 =====
final subscriptionRepositoryProvider =
    Provider<SubscriptionRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return SubscriptionRepository(dio);
});

class SubscriptionRepository {
  final Dio _dio;
  SubscriptionRepository(this._dio);

  Future<List<ActiveSubscription>> fetchActiveSubscriptions() async {
    final res = await _dio.get('/api/savings/subscriptions/active');
    final data = res.data as List<dynamic>;
    return data
        .map((e) => ActiveSubscription.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> depositToSubscription(int subscriptionId) async {
    await _dio.post('/api/savings/subscriptions/$subscriptionId/deposit');
    // 200 OK / 204 No Content 가정
  }
}