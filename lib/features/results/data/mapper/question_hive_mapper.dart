import '../../../exam/data/models/hive_models/question_hive_model.dart';
import '../../../exam/domain/entities/questions_entity.dart';
import 'answer_hive_mapper.dart';

extension QuestionHiveMapper on QuestionHiveModel {
  QuestionsEntity toEntity() {
    return QuestionsEntity(
      type: QuestionType.values[type],
      id: id,
      question: question,
      answers: answers.map((a) => a.toEntity()).toList(),
      correct: correct,
      userAnswer: userAnswer,
    );
  }
}
