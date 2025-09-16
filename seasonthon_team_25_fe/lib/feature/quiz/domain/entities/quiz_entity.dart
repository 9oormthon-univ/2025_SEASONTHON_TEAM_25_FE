enum QuizTypeEntity { mcq, ox }

class QuizEntity {
  final int userQuizId;
  final int quizId;
  final QuizTypeEntity type;
  final String question;
  final List<String> options;

  const QuizEntity({
    required this.userQuizId,
    required this.quizId,
    required this.type,
    required this.question,
    this.options = const [],
  });
}

class DailyQuizEntity {
  final List<QuizEntity> quizzes;
  final bool completed;

  const DailyQuizEntity({
    required this.quizzes,
    required this.completed,
  });
}
