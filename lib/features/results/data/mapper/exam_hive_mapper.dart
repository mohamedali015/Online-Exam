import '../../../exam/data/models/hive_models/exam_hive_model.dart';
import '../../../exams/domain/entities/exam_model.dart';

extension ExamHiveMapper on ExamHiveModel {
  ExamsModel toEntity() {
    return ExamsModel(
      id: id,
      title: title,
      duration: duration,
      numberOfQuestions: numberOfQuestions,
      subjectName: subjectName,
      icon: icon,
    );
  }
}
