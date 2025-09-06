import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';

/// 단순 요약 모델 (레포 파일 안에 함께 정의)
class ProductSummary {
  final int productSnapshotId;
  final String productName;
  final String bankName;
  final String aiSummary;

  ProductSummary({
    required this.productSnapshotId,
    required this.productName,
    required this.bankName,
    required this.aiSummary,
  });

  factory ProductSummary.fromJson(Map<String, dynamic> json) {
    return ProductSummary(
      productSnapshotId: json['productSnapshotId'] as int,
      productName: json['productName'] as String,
      bankName: json['bankName'] as String,
      aiSummary: (json['aiSummary'] as String?) ?? '',
    );
  }
}

class ProductRepository {
  final Dio _dio;
  ProductRepository(this._dio);

  /// GET /api/products?type=SAVING&sort=popular
  Future<List<ProductSummary>> fetchProducts({
    String type = 'SAVING',
    String sort = 'popular',
  }) async {
    final res = await _dio.get(
      '/api/products',
      queryParameters: {'type': type, 'sort': sort},
    );

    final data = res.data;
    final List list =
        (data is Map<String, dynamic>) ? (data['content'] as List? ?? const []) : const [];
    return list
        .map((e) => ProductSummary.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }
}

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ProductRepository(dio);
});