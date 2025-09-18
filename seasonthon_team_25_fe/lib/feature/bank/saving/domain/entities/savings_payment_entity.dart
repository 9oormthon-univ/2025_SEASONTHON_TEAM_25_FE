import 'package:freezed_annotation/freezed_annotation.dart';

part 'savings_payment_entity.freezed.dart';

@freezed
abstract class SavingsPaymentEntity with _$SavingsPaymentEntity {
  const factory SavingsPaymentEntity({
    required String code,
    required String message,
    required String timestamp,
  }) = _SavingsPaymentEntity;
}
