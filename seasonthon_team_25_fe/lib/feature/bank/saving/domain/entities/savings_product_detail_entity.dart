import 'package:freezed_annotation/freezed_annotation.dart';

part 'savings_product_detail_entity.freezed.dart';

@freezed
abstract class SavingsProductDetailEntity with _$SavingsProductDetailEntity {
  const factory SavingsProductDetailEntity({
    required String productName,
    required String bankName,
    required String maturityInterest,
    required String specialCondition,
    required String joinDeny,
    required String joinMember,
    int? maxLimit,
    required String intrRateType,
    required String intrRateTypeNm,
    required String rsrvType,
    required String rsrvTypeNm,
    required List<int> saveTrm,
    required List<double> intrRate,
    required List<double> intrRate2,
  }) = _SavingsProductDetailEntity;
}

