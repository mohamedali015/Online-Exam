import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/execute_api.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exams/api/exams_api_client.dart';
import 'package:online_exam/features/exams/data/data_source/exams_remote_data_source.dart';
import 'package:online_exam/features/exams/data/model/exams_dto.dart';

@Injectable(as: ExamsRemoteDataSource)
class ExamsRemoteDataSourceImpl implements ExamsRemoteDataSource {
  final ExamsApiClient _apiClient;

  ExamsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<List<Exams>>> getSubjectExams(String subjectId) {
    return executeApi<List<Exams>>(() async {
      final response = await _apiClient.getSubjectExams(subjectId);

      return response.exams ?? [];
    });
  }
}
