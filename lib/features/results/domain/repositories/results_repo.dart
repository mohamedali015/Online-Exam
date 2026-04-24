import '../../../../config/error_handling/result.dart';
import '../../../exam/domain/entities/exam_result_entity.dart';

abstract interface class ResultsRepo {
  Future<Result<List<ExamResultEntity>>> getAllResults();
}
