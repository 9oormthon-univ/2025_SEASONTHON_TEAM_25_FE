import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_list_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_detail_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_maturity_preview_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_subscription_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/active_savings_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_payment_entity.dart';

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

@freezed
abstract class SavingsProductDetailResponse with _$SavingsProductDetailResponse {
  const factory SavingsProductDetailResponse({
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
  }) = _SavingsProductDetailResponse;

  factory SavingsProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$SavingsProductDetailResponseFromJson(json);
}

extension SavingsProductDetailResponseX on SavingsProductDetailResponse {
  SavingsProductDetailEntity toEntity() => SavingsProductDetailEntity(
        productName: productName,
        bankName: bankName,
        maturityInterest: maturityInterest,
        specialCondition: specialCondition,
        joinDeny: joinDeny,
        joinMember: joinMember,
        maxLimit: maxLimit,
        intrRateType: intrRateType,
        intrRateTypeNm: intrRateTypeNm,
        rsrvType: rsrvType,
        rsrvTypeNm: rsrvTypeNm,
        saveTrm: saveTrm,
        intrRate: intrRate,
        intrRate2: intrRate2,
      );
}

@freezed
abstract class SavingsMaturityPreviewResponse with _$SavingsMaturityPreviewResponse {
  const factory SavingsMaturityPreviewResponse({
    required SavingsMaturityInfoModel ourService,
    required SavingsMaturityInfoModel preferentialRate,
  }) = _SavingsMaturityPreviewResponse;

  factory SavingsMaturityPreviewResponse.fromJson(Map<String, dynamic> json) =>
      _$SavingsMaturityPreviewResponseFromJson(json);
}

@freezed
abstract class SavingsMaturityInfoModel with _$SavingsMaturityInfoModel {
  const factory SavingsMaturityInfoModel({
    required int principal,
    required int interest,
    required int tax,
    required int totalAmount,
    required double interestRate,
  }) = _SavingsMaturityInfoModel;

  factory SavingsMaturityInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SavingsMaturityInfoModelFromJson(json);
}

extension SavingsMaturityPreviewResponseX on SavingsMaturityPreviewResponse {
  SavingsMaturityPreviewEntity toEntity() => SavingsMaturityPreviewEntity(
        ourService: ourService.toEntity(),
        preferentialRate: preferentialRate.toEntity(),
      );
}

extension SavingsMaturityInfoModelX on SavingsMaturityInfoModel {
  SavingsMaturityInfoEntity toEntity() => SavingsMaturityInfoEntity(
        principal: principal,
        interest: interest,
        tax: tax,
        totalAmount: totalAmount,
        interestRate: interestRate,
      );
}

@freezed
abstract class SavingsSubscriptionRequest with _$SavingsSubscriptionRequest {
  const factory SavingsSubscriptionRequest({
    required String productSnapshotId,
    required String termMonths,
    required String autoDebitAmount,
    required String reserveType,
  }) = _SavingsSubscriptionRequest;

  factory SavingsSubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$SavingsSubscriptionRequestFromJson(json);
}

@freezed
abstract class SavingsSubscriptionResponse with _$SavingsSubscriptionResponse {
  const factory SavingsSubscriptionResponse({
    required int subscriptionId,
    required String startDate,
    required String maturityDate,
    required String message,
  }) = _SavingsSubscriptionResponse;

  factory SavingsSubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SavingsSubscriptionResponseFromJson(json);
}

extension SavingsSubscriptionRequestX on SavingsSubscriptionRequestEntity {
  SavingsSubscriptionRequest toModel() => SavingsSubscriptionRequest(
        productSnapshotId: productSnapshotId,
        termMonths: termMonths,
        autoDebitAmount: autoDebitAmount,
        reserveType: reserveType,
      );
}

extension SavingsSubscriptionResponseX on SavingsSubscriptionResponse {
  SavingsSubscriptionEntity toEntity() => SavingsSubscriptionEntity(
        subscriptionId: subscriptionId,
        startDate: startDate,
        maturityDate: maturityDate,
        message: message,
      );
}

@freezed
abstract class ActiveSavingsModel with _$ActiveSavingsModel {
  const factory ActiveSavingsModel({
    required int subscriptionId,
    required String productName,
    required int currentAmount,
    required int progressPercentage,
    required String joinDate,
    required String maturityDate,
    required int remainingPayments,
  }) = _ActiveSavingsModel;

  factory ActiveSavingsModel.fromJson(Map<String, dynamic> json) =>
      _$ActiveSavingsModelFromJson(json);
}

extension ActiveSavingsModelX on ActiveSavingsModel {
  ActiveSavingsEntity toEntity() => ActiveSavingsEntity(
        subscriptionId: subscriptionId,
        productName: productName,
        currentAmount: currentAmount,
        progressPercentage: progressPercentage,
        joinDate: joinDate,
        maturityDate: maturityDate,
        remainingPayments: remainingPayments,
      );
}

extension ActiveSavingsListX on List<ActiveSavingsModel> {
  ActiveSavingsListEntity toEntity() => ActiveSavingsListEntity(
        activeSavings: map((model) => model.toEntity()).toList(),
      );
}

@freezed
abstract class SavingsPaymentResponse with _$SavingsPaymentResponse {
  const factory SavingsPaymentResponse({
    required String code,
    required String message,
    required String timestamp,
  }) = _SavingsPaymentResponse;

  factory SavingsPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$SavingsPaymentResponseFromJson(json);
}

extension SavingsPaymentResponseX on SavingsPaymentResponse {
  SavingsPaymentEntity toEntity() => SavingsPaymentEntity(
        code: code,
        message: message,
        timestamp: timestamp,
      );
}
