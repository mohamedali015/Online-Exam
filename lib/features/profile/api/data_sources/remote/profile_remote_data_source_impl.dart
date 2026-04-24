import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/execute_api.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/profile/api/profile_api_client/profile_api_client.dart';
import 'package:online_exam/features/profile/data/data_sources/remote/profile_remote_data_source.dart';
import 'package:online_exam/features/profile/data/models/responses/update_user_response/updated_user_data.dart';
import 'package:online_exam/features/profile/data/models/update_profile_request.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiClient _apiClient;

  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<UpdatedUserData>> updateUserData(UpdateProfileRequest request) {
    return executeApi(() async {
      final response = await _apiClient.updateUserData(request);
      if (response.user == null) {
        throw Exception(AppStrings.noUserData);
      }

      return response.user!;
    });
  }
}
