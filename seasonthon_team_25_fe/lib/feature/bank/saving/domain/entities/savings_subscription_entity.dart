import 'package:freezed_annotation/freezed_annotation.dart';

part 'savings_subscription_entity.freezed.dart';

@freezed
abstract class SavingsSubscriptionEntity with _$SavingsSubscriptionEntity {
  const factory SavingsSubscriptionEntity({
    required int subscriptionId,
    required String startDate,
    required String maturityDate,
    required String message,
  }) = _SavingsSubscriptionEntity;
}

@freezed
abstract class SavingsSubscriptionRequestEntity with _$SavingsSubscriptionRequestEntity {
  const factory SavingsSubscriptionRequestEntity({
    required String productSnapshotId,
    required String termMonths,
    required String autoDebitAmount,
    required String reserveType,
  }) = _SavingsSubscriptionRequestEntity;
}
