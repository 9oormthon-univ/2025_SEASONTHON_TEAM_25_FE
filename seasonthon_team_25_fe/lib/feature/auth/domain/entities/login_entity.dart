class LoginEntity {
  final String accessToken;
  final String refreshToken;
  final String tokenType; // e.g. "Bearer"
  final int expiresIn; // e.g. 1800

  // 유저 정보(평탄화)
  final int userId;
  final String email;
  final String role; // "USER"
  final String status; // "ACTIVE"
  final bool characterCreated;

  const LoginEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.userId,
    required this.email,
    required this.role,
    required this.status,
    required this.characterCreated,
  });
}
