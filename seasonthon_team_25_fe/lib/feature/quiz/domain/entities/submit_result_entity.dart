class SubmitResultEntity {
  final String explanation;
  final String category;       // "news" or "quiz"
  final String hint;           // newsId or string
  final String correctAnswer;  // "true"/"false" or "1".."n"
  final bool correct;

  const SubmitResultEntity({
    required this.explanation,
    required this.category,
    required this.hint,
    required this.correctAnswer,
    required this.correct,
  });

  bool get isOx => correctAnswer == 'true' || correctAnswer == 'false';
  bool? get correctAsBool => isOx ? (correctAnswer == 'true') : null;
  int? get correctAsIndex1Based =>
      isOx ? null : int.tryParse(correctAnswer);
}
