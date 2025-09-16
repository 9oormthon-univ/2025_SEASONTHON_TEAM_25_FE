class NickNameEntity {
  final String characterName;
  final bool characterCreated;
  final String? message;

  const NickNameEntity({
    required this.characterName,
    required this.characterCreated,
    this.message,
  });
}