import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';

abstract interface class ExamsRepo {
  Future<Result<List<ExamsModel>>> getSubjectExams({required String subjectId});
}
