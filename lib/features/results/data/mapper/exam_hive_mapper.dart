import '../../../exam/data/models/hive_models/exam_hive_model.dart';
import '../../../exams/domain/entities/exam_entity.dart';

extension ExamHiveMapper on ExamHiveModel {
  ExamEntity toEntity() {
    return ExamEntity(
      id: id,
      title: title,
      duration: duration,
      numberOfQuestions: numberOfQuestions,
      subjectName: subjectName,
      icon: icon,
    );
  }
}
