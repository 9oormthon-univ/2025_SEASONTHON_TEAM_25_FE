import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement_models.freezed.dart';
part 'achievement_models.g.dart';

/// 업적 아이템 모델
@freezed
abstract class AchievementItem with _$AchievementItem {
  const factory AchievementItem({
    required int achievementId,
    required String type,
    required String title,
    required String description,
    required String iconUrl,
    required int requirementCount,
    required bool claimed,
  }) = _AchievementItem;

  factory AchievementItem.fromJson(Map<String, dynamic> json) =>
      _$AchievementItemFromJson(json);
}

/// 업적 목록 응답 모델
@freezed
abstract class AchievementListResponse with _$AchievementListResponse {
  const factory AchievementListResponse({
    required List<AchievementItem> achievements,
  }) = _AchievementListResponse;

  factory AchievementListResponse.fromJson(Map<String, dynamic> json) =>
      _$AchievementListResponseFromJson(json);
}

/// 업적 확인 처리 응답 모델
@freezed
abstract class ClaimAchievementResponse with _$ClaimAchievementResponse {
  const factory ClaimAchievementResponse({
    required int achievementId,
    required String type,
    required String title,
    required String description,
    required String iconUrl,
    required bool claimed,
    required String message,
  }) = _ClaimAchievementResponse;

  factory ClaimAchievementResponse.fromJson(Map<String, dynamic> json) =>
      _$ClaimAchievementResponseFromJson(json);
}

/// 업적 타입 enum
enum AchievementType {
  @JsonValue('BEGINNERS_LUCK')
  beginnersLuck('BEGINNERS_LUCK', '초심자의 행운', '최초 가입 완료시 획득'),

  @JsonValue('MORNING_SUNSHINE')
  morningSunshine('MORNING_SUNSHINE', '아침 햇살', '30일 연속 출석시 획득'),

  @JsonValue('NEWS_ADDICT')
  newsAddict('NEWS_ADDICT', '속보 중독', '상세 뉴스 50회 열람시 획득'),

  @JsonValue('NEWS_COLLECTOR')
  newsCollector('NEWS_COLLECTOR', '소식좌', '뉴스 50회 스크랩시 획득'),

  @JsonValue('QUIZ_CURATOR')
  quizCurator('QUIZ_CURATOR', '퀴즈 큐레이터', '퀴즈 50회 스크랩시 획득'),

  // 추가 업적 타입들 (이미지에 보이는 것들)
  @JsonValue('MONEY_MAKER')
  moneyMaker('MONEY_MAKER', '머니 메이커', '수익률 10% 달성시 획득'),

  @JsonValue('MATURITY_EXPERT')
  maturityExpert('MATURITY_EXPERT', '만기의 달인', '만기 상품 5개 구매시 획득'),

  @JsonValue('ROYAL_FINANCER')
  royalFinancer('ROYAL_FINANCER', '로얄 파이낸서', 'VIP 등급 달성시 획득'),

  @JsonValue('ANTI_FRAGILE')
  antiFragile('ANTI_FRAGILE', '안티 프레자일', '리스크 관리 마스터시 획득');

  const AchievementType(this.value, this.title, this.description);

  final String value;
  final String title;
  final String description;
}
