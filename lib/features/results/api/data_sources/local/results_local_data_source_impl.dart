import 'package:injectable/injectable.dart';

import '../../../../../config/error_handling/result.dart';
import '../../../../../config/local_storage/hive_box_keys.dart';
import '../../../../../config/local_storage/local_storage.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../exam/data/models/hive_models/exam_result_hive_model.dart';
import '../../../data/data_sources/local/results_local_data_source.dart';

@Injectable(as: ResultsLocalDataSource)
class ResultsLocalDataSourceImpl implements ResultsLocalDataSource {
  final LocalStorage _storage;

  ResultsLocalDataSourceImpl(this._storage);

  @override
  Future<Result<List<ExamResultHiveModel>>> getAllResults() async {
    try {
      final results = await _storage.getAll<ExamResultHiveModel>(
        HiveBoxKeys.examResults,
      );

      return Success(data: results);
    } catch (e) {
      return Failure(errorMessage: AppStrings.failedToGetAllResults);
    }
  }
}
