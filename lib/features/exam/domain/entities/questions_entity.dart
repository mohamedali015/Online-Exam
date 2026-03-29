class QuestionsEntity {
  QuestionType type;
  String id;
  String question;
  List<AnswerEntity> answers;
  String correct;
  String? userAnswer;

  QuestionsEntity({
    required this.type,
    required this.id,
    required this.question,
    required this.answers,
    required this.correct,
    this.userAnswer,
  });
}

enum QuestionType { singleChoice, multipleChoice }

class AnswerEntity {
  String answer;
  String key;

  AnswerEntity({required this.answer, required this.key});
}
