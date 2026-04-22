import 'package:injectable/injectable.dart';
import 'package:online_exam/features/exam/domain/repositories/exam_repo.dart';

import '../../../../config/error_handling/result.dart';
import '../entities/exam_result_entity.dart';

@injectable
class SaveExamResultUseCase {
  final ExamRepo _repo;

  SaveExamResultUseCase(this._repo);

  Future<Result<bool>> call({required ExamResultEntity examResult}) {
    return _repo.saveExamResult(examResult);
  }
}
