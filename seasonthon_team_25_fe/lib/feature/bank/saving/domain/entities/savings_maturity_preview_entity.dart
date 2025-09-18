import 'package:freezed_annotation/freezed_annotation.dart';

part 'savings_maturity_preview_entity.freezed.dart';

@freezed
abstract class SavingsMaturityPreviewEntity with _$SavingsMaturityPreviewEntity {
  const factory SavingsMaturityPreviewEntity({
    required SavingsMaturityInfoEntity ourService,
    required SavingsMaturityInfoEntity preferentialRate,
  }) = _SavingsMaturityPreviewEntity;
}

@freezed
abstract class SavingsMaturityInfoEntity with _$SavingsMaturityInfoEntity {
  const factory SavingsMaturityInfoEntity({
    required int principal,
    required int interest,
    required int tax,
    required double totalAmount,
    required double interestRate,
  }) = _SavingsMaturityInfoEntity;
}



