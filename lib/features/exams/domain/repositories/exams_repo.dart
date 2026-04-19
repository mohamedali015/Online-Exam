import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exams/domain/entities/exam_entity.dart';

abstract interface class ExamsRepo {
  Future<Result<List<ExamEntity>>> getSubjectExams({required String subjectId});
}
