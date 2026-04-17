import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/config/user/api/user_api_client/user_api_client.dart';
import 'package:online_exam/config/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:online_exam/config/user/data/models/responses/get_user_response/get_user_data_response.dart';
import '../../../../cache/secure_cache/cache_keys.dart';
import '../../../../cache/secure_cache/secure_cache_helper.dart';
import '../../../../error_handling/execute_api.dart';

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
}
