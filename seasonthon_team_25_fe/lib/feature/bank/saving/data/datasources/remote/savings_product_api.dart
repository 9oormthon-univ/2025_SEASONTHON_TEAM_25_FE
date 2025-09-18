import 'package:dio/dio.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/data/models/savings_product_models.dart';

class SavingsProductApi {
  final Dio _dio;
  SavingsProductApi(this._dio);

  Future<SavingsProductResponse> getSavingsProducts({
    String type = "SAVING",
    String sort = "name",
    String? banks,
  }) async {
    final queryParams = {
      'type': type,
      if (sort != "name") 'sort': sort,
      if (banks != null) 'banks': banks,
    };

    final res = await _dio.get(
      '/api/savings/products',
      queryParameters: queryParams,
    );
    return SavingsProductResponse.fromJson(res.data);
  }

  Future<SavingsProductDetailResponse> getSavingsProductDetail(int productId) async {
    final res = await _dio.get('/api/savings/products/$productId');
    return SavingsProductDetailResponse.fromJson(res.data);
  }

  Future<SavingsMaturityPreviewResponse> getSavingsMaturityPreview(
    int productId, {
    required int monthlyAmount,
    required int termMonths,
  }) async {
    final res = await _dio.post(
      '/api/savings/products/$productId/maturity-preview',
      data: {
        'monthlyAmount': monthlyAmount,
        'termMonths': termMonths,
      },
    );
    return SavingsMaturityPreviewResponse.fromJson(res.data);
  }
}
