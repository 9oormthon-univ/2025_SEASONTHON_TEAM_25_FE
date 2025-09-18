class SignUpEntity {
  final int id;
  final String email;
  final String role;
  final String status;
  final bool characterCreated;
  final DateTime createdAt;

  SignUpEntity({
    required this.id,
    required this.email,
    required this.role,
    required this.status,
    required this.characterCreated,
    required this.createdAt,
  });
}
