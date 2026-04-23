import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/execute_api.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/profile/api/profile_api_client/profile_api_client.dart';
import 'package:online_exam/features/profile/data/data_sources/remote/profile_remote_data_source.dart';
import 'package:online_exam/features/profile/data/models/responses/update_user_response/updated_user.dart';

import '../../../data/models/request/change_password/change_password_request.dart';
import '../../../data/models/responses/change_password/change_password_response.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiClient _apiClient;

  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<UpdatedUser>> updateUserData(Map<String, dynamic> body) {
    return executeApi(() async {
      final response = await _apiClient.updateUserData(body);
      return response.user!;
    });
  }

  @override
  Future<Result<ChangePasswordResponse>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  }) {
    return executeApi(() async {
      final response = await _apiClient.changePassword(
        ChangePasswordRequest(
          oldPassword: oldPassword,
          password: newPassword,
          rePassword: rePassword,
        ),
      );
      return response;
    });
  }
}
