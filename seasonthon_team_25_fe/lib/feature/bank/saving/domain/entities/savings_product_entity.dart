import 'package:freezed_annotation/freezed_annotation.dart';

part 'savings_product_entity.freezed.dart';

@freezed
abstract class SavingsProductEntity with _$SavingsProductEntity {
  const factory SavingsProductEntity({
    required int productSnapshotId,
    required String productName,
    required String bankName,
    required String aiSummary,
  }) = _SavingsProductEntity;
}
