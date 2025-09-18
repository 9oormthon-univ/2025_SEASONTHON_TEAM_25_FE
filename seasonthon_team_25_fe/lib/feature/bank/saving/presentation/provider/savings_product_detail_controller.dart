import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seasonthon_team_25_fe/core/network/error_mapper.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_product_detail_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/entities/savings_maturity_preview_entity.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/usecases/get_savings_product_detail_usecase.dart';
import 'package:seasonthon_team_25_fe/feature/bank/saving/domain/usecases/get_savings_maturity_preview_usecase.dart';

/// 적금 상품 상세 상태 모델
class SavingsProductDetailState {
  final SavingsProductDetailEntity? productDetail;
  final SavingsMaturityPreviewEntity? maturityPreview;
  final int selectedPeriod;
  final int selectedAmount;
  final bool isLoadingDetail;
  final bool isLoadingPreview;
  final String? errorMessage;

  const SavingsProductDetailState({
    this.productDetail,
    this.maturityPreview,
    this.selectedPeriod = 12,
    this.selectedAmount = 100000,
    this.isLoadingDetail = false,
    this.isLoadingPreview = false,
    this.errorMessage,
  });

  SavingsProductDetailState copyWith({
    SavingsProductDetailEntity? productDetail,
    SavingsMaturityPreviewEntity? maturityPreview,
    int? selectedPeriod,
    int? selectedAmount,
    bool? isLoadingDetail,
    bool? isLoadingPreview,
    String? errorMessage,
  }) {
    return SavingsProductDetailState(
      productDetail: productDetail ?? this.productDetail,
      maturityPreview: maturityPreview ?? this.maturityPreview,
      selectedPeriod: selectedPeriod ?? this.selectedPeriod,
      selectedAmount: selectedAmount ?? this.selectedAmount,
      isLoadingDetail: isLoadingDetail ?? this.isLoadingDetail,
      isLoadingPreview: isLoadingPreview ?? this.isLoadingPreview,
      errorMessage: errorMessage,
    );
  }
}

final savingsProductDetailControllerProvider =
    StateNotifierProvider<SavingsProductDetailController, SavingsProductDetailState>((ref) {
  final detailUseCase = ref.watch(getSavingsProductDetailUseCaseProvider);
  final previewUseCase = ref.watch(getSavingsMaturityPreviewUseCaseProvider);
  return SavingsProductDetailController(detailUseCase, previewUseCase);
});

class SavingsProductDetailController extends StateNotifier<SavingsProductDetailState> {
  SavingsProductDetailController(this._getProductDetail, this._getMaturityPreview)
      : super(const SavingsProductDetailState());

  final GetSavingsProductDetailUseCase _getProductDetail;
  final GetSavingsMaturityPreviewUseCase _getMaturityPreview;

  Future<void> loadProductDetail(int productId) async {
    state = state.copyWith(isLoadingDetail: true, errorMessage: null);
    
    try {
      final detail = await _getProductDetail(productId);
      
      state = state.copyWith(
        productDetail: detail,
        isLoadingDetail: false,
      );
      
      // 상세 정보 로드 후 미리보기도 자동으로 로드
      await loadMaturityPreview(productId);
    } catch (e) {
      state = state.copyWith(
        isLoadingDetail: false,
        errorMessage: mapDioError(e).toString(),
      );
    }
  }

  Future<void> loadMaturityPreview(int productId) async {
    state = state.copyWith(isLoadingPreview: true);
    
    try {
      final preview = await _getMaturityPreview(
        productId,
        monthlyAmount: state.selectedAmount,
        termMonths: state.selectedPeriod,
      );
      
      state = state.copyWith(
        maturityPreview: preview,
        isLoadingPreview: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingPreview: false,
        errorMessage: mapDioError(e).toString(),
      );
    }
  }

  void updatePeriod(int period, int productId) {
    state = state.copyWith(selectedPeriod: period);
    loadMaturityPreview(productId);
  }

  void updateAmount(int amount, int productId) {
    state = state.copyWith(selectedAmount: amount);
    loadMaturityPreview(productId);
  }
}
