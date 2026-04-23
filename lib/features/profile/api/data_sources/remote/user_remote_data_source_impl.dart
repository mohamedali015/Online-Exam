import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/profile/api/user_api_client/user_api_client.dart';
import 'package:online_exam/features/profile/data/data_sources/remote/user_remote_data_source.dart';
import 'package:online_exam/features/profile/data/models/responses/change_password/change_password_response.dart';
import 'package:online_exam/features/profile/data/models/responses/get_user_response/get_user_data_response.dart';

import '../../../../../config/cache/secure_cache/cache_keys.dart';
import '../../../../../config/cache/secure_cache/secure_cache_helper.dart';
import '../../../../../config/error_handling/execute_api.dart';
import '../../../data/models/request/change_password/change_password_request.dart';

@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserApiClient _apiClient;

  UserRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Result<GetUserDataResponse>> getUserData() async {
    return executeApi(() async {
      final token = await SecureCacheHelper.getData(key: CacheKeys.token);
      final response = await _apiClient.getUserData(token!);
      return response;
    });
  }

  @override
  Future<Result<ChangePasswordResponse>> changePassword(
      {required String oldPassword, required String newPassword, required String rePassword}) {
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
