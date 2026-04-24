import 'package:injectable/injectable.dart';
import 'package:online_exam/config/local_storage/hive_box_keys.dart';
import 'package:online_exam/core/values/app_strings.dart';
import '../../../../../config/error_handling/result.dart';
import '../../../../../config/local_storage/local_storage.dart';
import '../../../data/data_sources/local/exam_local_data_source.dart';
import '../../../data/models/hive_models/exam_result_hive_model.dart';

@Injectable(as: ExamLocalDataSource)
class ExamLocalDataSourceImpl implements ExamLocalDataSource {
  final LocalStorage _storage;

  ExamLocalDataSourceImpl(this._storage);

  @override
  Future<Result<bool>> saveExamResult(ExamResultHiveModel model) async {
    try {
      await _storage.add(box: HiveBoxKeys.examResults, value: model);

      return Success(data: true);
    } catch (e) {
      return Failure(errorMessage: AppStrings.failedToSaveExamResult);
    }
  }
}
