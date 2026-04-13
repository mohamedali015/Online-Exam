import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/home/data/model/response/get_all_subjects_response.dart';
import '../../../../../config/error_handling/execute_api.dart';
import '../../../data/data_source/get_all_subjects_remote_data_source.dart';
import '../../all_subjects_api_client/all_subjects_api_client.dart';

@Injectable(as: GetAllSubjectsDataSource)
class GetAllSubjectsRemoteDataSourceImpl implements GetAllSubjectsDataSource {

  final AllSubjectsApiClient _allSubjectsApiClient;
  @factoryMethod
  GetAllSubjectsRemoteDataSourceImpl(this._allSubjectsApiClient);

  @override
  Future<Result<GetAllSubjectsResponse>> getSubjects({required String token}) {
    return executeApi<GetAllSubjectsResponse>(() async {
      var response = await _allSubjectsApiClient.getAllSubjects(token);
      return response;
    });
  }

}
