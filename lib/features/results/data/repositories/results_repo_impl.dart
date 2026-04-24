import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exam/domain/entities/exam_result_entity.dart';
import '../../domain/repositories/results_repo.dart';
import '../data_sources/local/results_local_data_source.dart';
import '../mapper/exam_result_mapper.dart';

@Injectable(as: ResultsRepo)
class ResultsRepoImpl implements ResultsRepo {
  final ResultsLocalDataSource _localDataSource;

  ResultsRepoImpl(this._localDataSource);

  @override
  Future<Result<List<ExamResultEntity>>> getAllResults() async {
    final result = await _localDataSource.getAllResults();

    switch (result) {
      case Success():
        {
          return Success(data: result.data.map((e) => e.toEntity()).toList());
        }

      case Failure():
        {
          return Failure(errorMessage: result.errorMessage);
        }
    }
  }
}
