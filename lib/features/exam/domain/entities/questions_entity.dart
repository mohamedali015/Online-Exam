import 'package:equatable/equatable.dart';

class QuestionsEntity extends Equatable {
  final QuestionType type;
  final String id;
  final String question;
  final List<AnswerEntity> answers;
  final String correct;
  final String? userAnswer;

  const QuestionsEntity({
    required this.type,
    required this.id,
    required this.question,
    required this.answers,
    required this.correct,
    this.userAnswer,
  });

  @override
  List<Object?> get props => [type, id, question, answers, correct, userAnswer];
}

enum QuestionType { singleChoice, multipleChoice }

class AnswerEntity extends Equatable {
  final String answer;
  final String key;

  const AnswerEntity({required this.answer, required this.key});

  @override
  List<Object?> get props => [answer, key];
}
