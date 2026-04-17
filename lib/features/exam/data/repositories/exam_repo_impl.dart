import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';

import 'package:online_exam/features/exam/domain/entities/questions_entity.dart';

import '../../domain/repositories/exam_repo.dart';
import '../data_sources/remote/exam_remote_data_source.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamRemoteDataSource _remoteDataSource;

  ExamRepoImpl(this._remoteDataSource);

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
}
