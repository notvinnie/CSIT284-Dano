class Quiztion {
  const Quiztion(this.question, this.answers, {required this.correctAnswer});

  final String question;
  final List<String> answers;
  final String correctAnswer;
}
