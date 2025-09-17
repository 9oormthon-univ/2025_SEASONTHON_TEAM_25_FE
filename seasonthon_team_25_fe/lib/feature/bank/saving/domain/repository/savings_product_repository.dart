import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_list_entity.dart';

abstract class SavingsProductRepository {
  Future<SavingsProductListEntity> getSavingsProducts({
    String type,
    String sort,
    String? banks,
  });
}
