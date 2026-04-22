import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exam/domain/entities/exam_result_entity.dart';

import 'package:online_exam/features/exam/domain/entities/questions_entity.dart';

import '../../domain/repositories/exam_repo.dart';
import '../data_sources/local/exam_local_data_source.dart';
import '../data_sources/remote/exam_remote_data_source.dart';
import '../mappers/exam_result_mapper.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamRemoteDataSource _remoteDataSource;
  final ExamLocalDataSource _localDataSource;

  ExamRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<List<QuestionsEntity>>> getExamQuestions({
    required String examId,
  }) async {
    final response = await _remoteDataSource.getExamQuestions(examId: examId);

    switch (response) {
      case Success():
        {
          return Success(
            data:
                response.data.questions
                    ?.map((dto) => dto.toQuestionsEntity())
                    .toList() ??
                [],
          );
        }
      case Failure():
        {
          return Failure(errorMessage: response.errorMessage);
        }
    }
  }

  @override
  Future<Result<bool>> saveExamResult(ExamResultEntity examResult) async {
    final response = await _localDataSource.saveExamResult(
      examResult.toHiveModel(),
    );

    switch (response) {
      case Success():
        {
          return Success(data: true);
        }

      case Failure():
        {
          return Failure(errorMessage: response.errorMessage);
        }
    }
  }
}
