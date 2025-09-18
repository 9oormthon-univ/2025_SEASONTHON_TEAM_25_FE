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

_SavingsProductDetailResponse _$SavingsProductDetailResponseFromJson(
  Map<String, dynamic> json,
) => _SavingsProductDetailResponse(
  productName: json['productName'] as String,
  bankName: json['bankName'] as String,
  maturityInterest: json['maturityInterest'] as String,
  specialCondition: json['specialCondition'] as String,
  joinDeny: json['joinDeny'] as String,
  joinMember: json['joinMember'] as String,
  maxLimit: (json['maxLimit'] as num?)?.toInt(),
  intrRateType: json['intrRateType'] as String,
  intrRateTypeNm: json['intrRateTypeNm'] as String,
  rsrvType: json['rsrvType'] as String,
  rsrvTypeNm: json['rsrvTypeNm'] as String,
  saveTrm: (json['saveTrm'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  intrRate: (json['intrRate'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  intrRate2: (json['intrRate2'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$SavingsProductDetailResponseToJson(
  _SavingsProductDetailResponse instance,
) => <String, dynamic>{
  'productName': instance.productName,
  'bankName': instance.bankName,
  'maturityInterest': instance.maturityInterest,
  'specialCondition': instance.specialCondition,
  'joinDeny': instance.joinDeny,
  'joinMember': instance.joinMember,
  'maxLimit': instance.maxLimit,
  'intrRateType': instance.intrRateType,
  'intrRateTypeNm': instance.intrRateTypeNm,
  'rsrvType': instance.rsrvType,
  'rsrvTypeNm': instance.rsrvTypeNm,
  'saveTrm': instance.saveTrm,
  'intrRate': instance.intrRate,
  'intrRate2': instance.intrRate2,
};

_SavingsMaturityPreviewResponse _$SavingsMaturityPreviewResponseFromJson(
  Map<String, dynamic> json,
) => _SavingsMaturityPreviewResponse(
  ourService: SavingsMaturityInfoModel.fromJson(
    json['ourService'] as Map<String, dynamic>,
  ),
  preferentialRate: SavingsMaturityInfoModel.fromJson(
    json['preferentialRate'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SavingsMaturityPreviewResponseToJson(
  _SavingsMaturityPreviewResponse instance,
) => <String, dynamic>{
  'ourService': instance.ourService,
  'preferentialRate': instance.preferentialRate,
};

_SavingsMaturityInfoModel _$SavingsMaturityInfoModelFromJson(
  Map<String, dynamic> json,
) => _SavingsMaturityInfoModel(
  principal: (json['principal'] as num).toInt(),
  interest: (json['interest'] as num).toInt(),
  tax: (json['tax'] as num).toInt(),
  totalAmount: (json['totalAmount'] as num).toInt(),
  interestRate: (json['interestRate'] as num).toDouble(),
);

Map<String, dynamic> _$SavingsMaturityInfoModelToJson(
  _SavingsMaturityInfoModel instance,
) => <String, dynamic>{
  'principal': instance.principal,
  'interest': instance.interest,
  'tax': instance.tax,
  'totalAmount': instance.totalAmount,
  'interestRate': instance.interestRate,
};

_SavingsSubscriptionRequest _$SavingsSubscriptionRequestFromJson(
  Map<String, dynamic> json,
) => _SavingsSubscriptionRequest(
  productSnapshotId: json['productSnapshotId'] as String,
  termMonths: json['termMonths'] as String,
  autoDebitAmount: json['autoDebitAmount'] as String,
  reserveType: json['reserveType'] as String,
);

Map<String, dynamic> _$SavingsSubscriptionRequestToJson(
  _SavingsSubscriptionRequest instance,
) => <String, dynamic>{
  'productSnapshotId': instance.productSnapshotId,
  'termMonths': instance.termMonths,
  'autoDebitAmount': instance.autoDebitAmount,
  'reserveType': instance.reserveType,
};

_SavingsSubscriptionResponse _$SavingsSubscriptionResponseFromJson(
  Map<String, dynamic> json,
) => _SavingsSubscriptionResponse(
  subscriptionId: (json['subscriptionId'] as num).toInt(),
  startDate: json['startDate'] as String,
  maturityDate: json['maturityDate'] as String,
  message: json['message'] as String,
);

Map<String, dynamic> _$SavingsSubscriptionResponseToJson(
  _SavingsSubscriptionResponse instance,
) => <String, dynamic>{
  'subscriptionId': instance.subscriptionId,
  'startDate': instance.startDate,
  'maturityDate': instance.maturityDate,
  'message': instance.message,
};

_ActiveSavingsModel _$ActiveSavingsModelFromJson(Map<String, dynamic> json) =>
    _ActiveSavingsModel(
      subscriptionId: (json['subscriptionId'] as num).toInt(),
      productName: json['productName'] as String,
      currentAmount: (json['currentAmount'] as num).toInt(),
      progressPercentage: (json['progressPercentage'] as num).toInt(),
      joinDate: json['joinDate'] as String,
      maturityDate: json['maturityDate'] as String,
      remainingPayments: (json['remainingPayments'] as num).toInt(),
    );

Map<String, dynamic> _$ActiveSavingsModelToJson(_ActiveSavingsModel instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'productName': instance.productName,
      'currentAmount': instance.currentAmount,
      'progressPercentage': instance.progressPercentage,
      'joinDate': instance.joinDate,
      'maturityDate': instance.maturityDate,
      'remainingPayments': instance.remainingPayments,
    };

_SavingsPaymentResponse _$SavingsPaymentResponseFromJson(
  Map<String, dynamic> json,
) => _SavingsPaymentResponse(
  code: json['code'] as String,
  message: json['message'] as String,
  timestamp: json['timestamp'] as String,
);

Map<String, dynamic> _$SavingsPaymentResponseToJson(
  _SavingsPaymentResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'timestamp': instance.timestamp,
};

_SavingsTermResponse _$SavingsTermResponseFromJson(Map<String, dynamic> json) =>
    _SavingsTermResponse(
      term: json['term'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$SavingsTermResponseToJson(
  _SavingsTermResponse instance,
) => <String, dynamic>{
  'term': instance.term,
  'description': instance.description,
};
