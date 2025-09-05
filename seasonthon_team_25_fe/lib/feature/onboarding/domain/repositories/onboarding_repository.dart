abstract class OnboardingRepository {
  /// 성공(2xx): SignUpEntity 반환
  /// 실패(4xx/5xx): 예외 던짐
  /// 유저 닉네임 설정으로 변경됨
  Future<void> createCharacter({required String characterName});
}
