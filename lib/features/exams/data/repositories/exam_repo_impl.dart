import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exams/data/data_source/exams_remote_data_source.dart';
import 'package:online_exam/features/exams/data/model/exams_dto.dart';
import 'package:online_exam/features/exams/domain/entities/exam_entity.dart';
import 'package:online_exam/features/exams/domain/repositories/exams_repo.dart';

@Injectable(as: ExamsRepo)
class ExamsRepoImpl implements ExamsRepo {
  final ExamsRemoteDataSource _examsRemoteDataSource;
  ExamsRepoImpl(this._examsRemoteDataSource);
  @override
  Future<Result<List<ExamEntity>>> getSubjectExams({
    required String subjectId,
  }) async {
    final response = await _examsRemoteDataSource.getSubjectExams(subjectId);
    switch (response) {
      case Success<List<Exams>>():
        return Success<List<ExamEntity>>(
          data: response.data.map((dto) => dto.toEntity()).toList(),
        );

      case Failure<List<Exams>>():
        return Failure<List<ExamEntity>>(errorMessage: response.errorMessage);
    }
  }
}
