import 'package:seasonthon_team_25_fe/feature/quiz/domain/entities/quiz_entity.dart';

sealed class QuizAnswerEntity {
  final int userQuizId; // 제출 PK
  final QuizTypeEntity type;
  const QuizAnswerEntity(this.userQuizId, this.type);

  String toApiString(); // "true"/"false" or "1".."n"
}

final class OxAnswerEntity extends QuizAnswerEntity {
  final bool value;
  const OxAnswerEntity({required int userQuizId, required this.value})
    : super(userQuizId, QuizTypeEntity.ox);

  @override
  String toApiString() => value.toString();
}

final class McqAnswerEntity extends QuizAnswerEntity {
  final int index1Based; // 1..n
  const McqAnswerEntity({required int userQuizId, required this.index1Based})
    : super(userQuizId, QuizTypeEntity.mcq);

  @override
  String toApiString() => index1Based.toString();
}
