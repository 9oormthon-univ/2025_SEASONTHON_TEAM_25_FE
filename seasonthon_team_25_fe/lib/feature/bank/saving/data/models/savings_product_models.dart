import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_list_entity.dart';

part 'savings_product_models.freezed.dart';
part 'savings_product_models.g.dart';

@freezed
abstract class SavingsProductResponse with _$SavingsProductResponse {
  const factory SavingsProductResponse({
    required List<SavingsProductModel> content,
    required List<String> bankNames,
  }) = _SavingsProductResponse;

  factory SavingsProductResponse.fromJson(Map<String, dynamic> json) =>
      _$SavingsProductResponseFromJson(json);
}

@freezed
abstract class SavingsProductModel with _$SavingsProductModel {
  const factory SavingsProductModel({
    required int productSnapshotId,
    required String productName,
    required String bankName,
    required String aiSummary,
  }) = _SavingsProductModel;

  factory SavingsProductModel.fromJson(Map<String, dynamic> json) =>
      _$SavingsProductModelFromJson(json);
}

extension SavingsProductModelX on SavingsProductModel {
  SavingsProductEntity toEntity() => SavingsProductEntity(
        productSnapshotId: productSnapshotId,
        productName: productName,
        bankName: bankName,
        aiSummary: aiSummary,
      );
}

extension SavingsProductResponseX on SavingsProductResponse {
  SavingsProductListEntity toEntity() => SavingsProductListEntity(
        content: content.map((m) => m.toEntity()).toList(),
        bankNames: bankNames,
      );
}
