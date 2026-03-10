import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam/features/auth/data/model/response/auth_response.dart';
import '../../../../../config/error_handling/execute_api.dart';
import '../../../data/model/request/login_request.dart';
import '../../api_client.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);
  @override
  Future<Result<AuthResponse>> login({
    required String email,
    required String password,
  }) {
    return executeApi<AuthResponse>(() async {
      var response = await _apiClient.login(
        LoginRequest(email: email, password: password),
      );
      return response;
    });
  }
}
