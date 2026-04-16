import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/execute_api.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/api/api_client.dart';
import 'package:online_exam/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:online_exam/features/auth/data/model/request/register_request.dart';
import 'package:online_exam/features/auth/data/model/response/auth_response.dart';
import '../../../data/model/request/login_request.dart';



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

  @override
  Future<Result<AuthResponse>> register({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  }) {
    return executeApi<AuthResponse>(() async {
      var response = await _apiClient.register(
        RegisterRequest(
          username: userName,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          rePassword: confirmPassword,
          phone: phone,
        ),
      );
      return response;
    });
  }
}




