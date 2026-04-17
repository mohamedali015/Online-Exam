import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exams/data/model/exams_dto.dart';

abstract interface class ExamsRemoteDataSource {
  Future<Result<List<Exams>>> getSubjectExams(String subjectId);
}
