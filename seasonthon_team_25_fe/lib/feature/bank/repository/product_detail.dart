import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';

class SignUpArgs {
  final int termMonths;
  final int maxLimit;
  final String productName;

  const SignUpArgs({
    required this.termMonths,
    required this.maxLimit,
    required this.productName,
  });
}

/// 옵션 모델
class ProductOption {
  final int termMonths;
  final double rate;
  final double ratePreferential;
  final String rateTypeName;
  final String reserveTypeName;

  ProductOption({
    required this.termMonths,
    required this.rate,
    required this.ratePreferential,
    required this.rateTypeName,
    required this.reserveTypeName,
  });

  factory ProductOption.fromJson(Map<String, dynamic> json) {
    return ProductOption(
      termMonths: json['termMonths'] as int,
      rate: (json['rate'] as num).toDouble(),
      ratePreferential: (json['ratePreferential'] as num).toDouble(),
      rateTypeName: json['rateTypeName'] as String,
      reserveTypeName: json['reserveTypeName'] as String,
    );
  }
}

/// 상세 모델
class ProductDetail {
  final int productSnapshotId;
  final String productName;
  final String bankName;
  final String joinWay;
  final String maturityInterest;
  final String specialCondition;
  final String joinDeny;
  final String joinMember;
  final int maxLimit;
  final String etcNote;
  final String aiSummary;
  final String fetchedAt;
  final List<ProductOption> options;

  ProductDetail({
    required this.productSnapshotId,
    required this.productName,
    required this.bankName,
    required this.joinWay,
    required this.maturityInterest,
    required this.specialCondition,
    required this.joinDeny,
    required this.joinMember,
    required this.maxLimit,
    required this.etcNote,
    required this.aiSummary,
    required this.fetchedAt,
    required this.options,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      productSnapshotId: json['productSnapshotId'] as int,
      productName: json['productName'] as String,
      bankName: json['bankName'] as String,
      joinWay: json['joinWay'] as String,
      maturityInterest: json['maturityInterest'] as String,
      specialCondition: json['specialCondition'] as String,
      joinDeny: json['joinDeny'] as String,
      joinMember: json['joinMember'] as String,
      maxLimit: json['maxLimit'] as int,
      etcNote: json['etcNote'] as String,
      aiSummary: json['aiSummary'] as String,
      fetchedAt: json['fetchedAt'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => ProductOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ProductDetailRepository {
  final Dio _dio;
  ProductDetailRepository(this._dio);

  Future<ProductDetail> fetchDetail(int id) async {
    final res = await _dio.get('/api/products/$id');
    return ProductDetail.fromJson(res.data as Map<String, dynamic>);
  }
}

final productDetailRepositoryProvider = Provider<ProductDetailRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductDetailRepository(dio);
});