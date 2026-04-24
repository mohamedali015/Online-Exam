import '../../../../../config/error_handling/result.dart';
import '../../models/hive_models/exam_result_hive_model.dart';

abstract interface class ExamLocalDataSource {
  Future<Result<bool>> saveExamResult(ExamResultHiveModel model);
}
