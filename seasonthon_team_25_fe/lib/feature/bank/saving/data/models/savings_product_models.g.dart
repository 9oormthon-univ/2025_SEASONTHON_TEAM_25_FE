// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_product_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavingsProductResponse _$SavingsProductResponseFromJson(
  Map<String, dynamic> json,
) => _SavingsProductResponse(
  content: (json['content'] as List<dynamic>)
      .map((e) => SavingsProductModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  bankNames: (json['bankNames'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SavingsProductResponseToJson(
  _SavingsProductResponse instance,
) => <String, dynamic>{
  'content': instance.content,
  'bankNames': instance.bankNames,
};

_SavingsProductModel _$SavingsProductModelFromJson(Map<String, dynamic> json) =>
    _SavingsProductModel(
      productSnapshotId: (json['productSnapshotId'] as num).toInt(),
      productName: json['productName'] as String,
      bankName: json['bankName'] as String,
      aiSummary: json['aiSummary'] as String,
    );

Map<String, dynamic> _$SavingsProductModelToJson(
  _SavingsProductModel instance,
) => <String, dynamic>{
  'productSnapshotId': instance.productSnapshotId,
  'productName': instance.productName,
  'bankName': instance.bankName,
  'aiSummary': instance.aiSummary,
};
