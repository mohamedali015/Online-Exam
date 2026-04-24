import 'package:online_exam/features/exam/domain/entities/questions_entity.dart';

import '../../../exams/domain/entities/exam_entity.dart';

class ExamResultEntity {
  final ExamEntity exam;
  final List<QuestionsEntity> questions;
  final int correctAnswers;
  final int wrongAnswers;
  final double percentage;
  final int spentMinutes;

  const ExamResultEntity({
    required this.exam,
    required this.questions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.percentage,
    required this.spentMinutes,
  });
}