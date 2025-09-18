import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/dio_provider.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/data/datasources/remote/savings_product_api.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/data/models/savings_product_models.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_list_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_detail_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_maturity_preview_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/repository/savings_product_repository.dart';

class SavingsProductRepositoryImpl implements SavingsProductRepository {
  final SavingsProductApi _api;
  SavingsProductRepositoryImpl(this._api);

  @override
  Future<SavingsProductListEntity> getSavingsProducts({
    String type = "SAVING",
    String sort = "name",
    String? banks,
  }) async {
    final res = await _api.getSavingsProducts(
      type: type,
      sort: sort,
      banks: banks,
    );
    return res.toEntity();
  }

  @override
  Future<SavingsProductDetailEntity> getSavingsProductDetail(int productId) async {
    final res = await _api.getSavingsProductDetail(productId);
    return res.toEntity();
  }

  @override
  Future<SavingsMaturityPreviewEntity> getSavingsMaturityPreview(
    int productId, {
    required int monthlyAmount,
    required int termMonths,
  }) async {
    final res = await _api.getSavingsMaturityPreview(
      productId,
      monthlyAmount: monthlyAmount,
      termMonths: termMonths,
    );
    return res.toEntity();
  }
}

final savingsProductRepositoryProvider = Provider<SavingsProductRepository>((
  ref,
) {
  final dio = ref.watch(dioProvider);
  final api = SavingsProductApi(dio);
  return SavingsProductRepositoryImpl(api);
});
