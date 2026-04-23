import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/execute_api.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/profile/api/profile_api_client/update_profile_api_client.dart';
import 'package:online_exam/features/profile/data/data_sources/remote/update_profile_remote_data_source.dart';
import 'package:online_exam/features/profile/data/models/responses/update_user_response/updated_user.dart';

@Injectable(as: UpdateProfileRemoteDataSource)
class UpdateProfileRemoteDataSourceImpl
    implements UpdateProfileRemoteDataSource {
  final UpdateProfileApiClient _apiClient;

  UpdateProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<UpdatedUser>> updateUserData(Map<String, dynamic> body) {
    return executeApi(() async {
      final response = await _apiClient.updateUserData(body);
      return response.user!;
    });
  }
}
