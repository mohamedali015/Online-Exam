import 'package:online_exam/features/exam/domain/entities/exam_result_entity.dart';
import 'package:online_exam/features/results/data/mapper/question_hive_mapper.dart';

import '../../../exam/data/models/hive_models/exam_result_hive_model.dart';
import 'exam_hive_mapper.dart';

extension ExamResultHiveMapper on ExamResultHiveModel {
  ExamResultEntity toEntity() {
    return ExamResultEntity(
      exam: exam.toEntity(),
      questions: questions.map((q) => q.toEntity()).toList(),
      correctAnswers: correctAnswers,
      wrongAnswers: wrongAnswers,
      percentage: percentage,
      spentMinutes: spentMinutes,
    );
  }
}
