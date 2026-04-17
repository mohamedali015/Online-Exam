import 'package:injectable/injectable.dart';
import 'package:online_exam/config/cache/secure_cache/cache_keys.dart';
import 'package:online_exam/config/cache/secure_cache/secure_cache_helper.dart';
import 'package:online_exam/config/error_handling/execute_api.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exam/api/exam_api_client/exam_api_client.dart';
import 'package:online_exam/features/exam/data/data_sources/remote/exam_remote_data_source.dart';
import 'package:online_exam/features/exam/data/models/responses/exam_questions_response/exam_questions_response.dart';

@Injectable(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ExamApiClient _apiClient;

  ExamRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<ExamQuestionsResponse>> getExamQuestions({
    required String examId,
  }) {
    return executeApi(() async {
      final token = await SecureCacheHelper.getData(key: CacheKeys.token);
      return await _apiClient.getExamQuestions(examId, token!);
    });
  }
}
