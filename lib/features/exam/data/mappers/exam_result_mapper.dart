import '../../domain/entities/exam_result_entity.dart';
import '../models/hive_models/answer_hive_model.dart';
import '../models/hive_models/exam_hive_model.dart';
import '../models/hive_models/exam_result_hive_model.dart';
import '../models/hive_models/question_hive_model.dart';

extension ExamResultMapper on ExamResultEntity {
  ExamResultHiveModel toHiveModel() {
    return ExamResultHiveModel(
      exam: ExamHiveModel(
        id: exam.id,
        title: exam.title,
        duration: exam.duration,
        numberOfQuestions: exam.numberOfQuestions,
        subjectName: exam.subjectName,
      ),
      questions: questions.map((q) {
        return QuestionHiveModel(
          id: q.id,
          question: q.question,
          correct: q.correct,
          userAnswer: q.userAnswer,
          type: q.type.index,
          answers: q.answers.map((a) {
            return AnswerHiveModel(answer: a.answer, key: a.key);
          }).toList(),
        );
      }).toList(),
      correctAnswers: correctAnswers,
      wrongAnswers: wrongAnswers,
      percentage: percentage,
      spentMinutes: spentMinutes,
      date: DateTime.now(),
    );
  }
}
