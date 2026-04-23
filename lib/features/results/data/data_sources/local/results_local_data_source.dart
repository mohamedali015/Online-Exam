import '../../../../../config/error_handling/result.dart';
import '../../../../exam/data/models/hive_models/exam_result_hive_model.dart';

abstract interface class ResultsLocalDataSource {
  Future<Result<List<ExamResultHiveModel>>> getAllResults();
}
