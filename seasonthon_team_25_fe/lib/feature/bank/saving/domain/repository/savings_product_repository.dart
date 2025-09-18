import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_list_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_detail_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_maturity_preview_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_subscription_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/active_savings_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_payment_entity.dart';

abstract class SavingsProductRepository {
  Future<SavingsProductListEntity> getSavingsProducts({
    String type,
    String sort,
    String? banks,
  });

  Future<SavingsProductDetailEntity> getSavingsProductDetail(int productId);

  Future<SavingsMaturityPreviewEntity> getSavingsMaturityPreview(
    int productId, {
    required int monthlyAmount,
    required int termMonths,
  });

  Future<SavingsSubscriptionEntity> subscribeSavings(
    SavingsSubscriptionRequestEntity request,
  );

  Future<ActiveSavingsListEntity> getActiveSavings();

  Future<SavingsPaymentEntity> makePayment(int subscriptionId);
}
