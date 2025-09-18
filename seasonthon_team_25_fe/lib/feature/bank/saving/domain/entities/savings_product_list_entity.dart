import 'package:freezed_annotation/freezed_annotation.dart';
import 'savings_product_entity.dart';

part 'savings_product_list_entity.freezed.dart';

@freezed
abstract class SavingsProductListEntity with _$SavingsProductListEntity {
  const factory SavingsProductListEntity({
    required List<SavingsProductEntity> content,
    required List<String> bankNames,
  }) = _SavingsProductListEntity;
}
