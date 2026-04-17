import 'package:online_exam/features/exam/domain/entities/questions_entity.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';

class ExamResultEntity {
  final ExamsModel exam;
  final List<QuestionsEntity> questions;
  final int correctAnswers;
  final int wrongAnswers;
  final double percentage;

  const ExamResultEntity({
    required this.exam,
    required this.questions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.percentage,
  });
}
