import 'package:injectable/injectable.dart';

import '../../../../config/error_handling/result.dart';
import '../../../exam/domain/entities/exam_result_entity.dart';
import '../repositories/results_repo.dart';

@injectable
class GetAllResultsUseCase {
  final ResultsRepo _repo;

  GetAllResultsUseCase(this._repo);

  Future<Result<List<ExamResultEntity>>> call() {
    return _repo.getAllResults();
  }
}
