class UserEntity {
  final int userId;
  final String email;
  final String role; // e.g. "USER"
  final String status; // e.g. "ACTIVE"
  final String? characterName;
  final bool characterCreated;

  const UserEntity({
    required this.userId,
    required this.email,
    required this.role,
    required this.status,
    required this.characterCreated,
    this.characterName,
  });
}