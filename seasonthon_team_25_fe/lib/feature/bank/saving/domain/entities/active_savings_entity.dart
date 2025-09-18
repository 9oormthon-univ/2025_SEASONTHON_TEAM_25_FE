import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_savings_entity.freezed.dart';

@freezed
abstract class ActiveSavingsEntity with _$ActiveSavingsEntity {
  const factory ActiveSavingsEntity({
    required int subscriptionId,
    required String productName,
    required int currentAmount,
    required int progressPercentage,
    required String joinDate,
    required String maturityDate,
    required int remainingPayments,
  }) = _ActiveSavingsEntity;
}

@freezed
abstract class ActiveSavingsListEntity with _$ActiveSavingsListEntity {
  const factory ActiveSavingsListEntity({
    required List<ActiveSavingsEntity> activeSavings,
  }) = _ActiveSavingsListEntity;
}
