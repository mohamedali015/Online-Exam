import 'package:equatable/equatable.dart';

class QuestionsEntity extends Equatable {
  final QuestionType type;
  final String id;
  final String question;
  final List<AnswerEntity> answers;
  final String correct;
  final String userAnswer;

  const QuestionsEntity({
    required this.type,
    required this.id,
    required this.question,
    required this.answers,
    required this.correct,
    required this.userAnswer,
  });

  QuestionsEntity copyWith({
    QuestionType? typeParam,
    String? idParam,
    String? questionParam,
    List<AnswerEntity>? answersParam,
    String? correctParam,
    String? userAnswerParam
  }) {
    return QuestionsEntity(
        type: typeParam ?? type,
        id: idParam ?? id,
        question: questionParam ?? question,
        answers: answersParam ?? answers,
        correct: correctParam ?? correct,
        userAnswer: userAnswerParam ?? userAnswer
    );
  }

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
