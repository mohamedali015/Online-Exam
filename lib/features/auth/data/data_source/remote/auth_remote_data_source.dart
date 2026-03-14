import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/data/model/response/auth_response.dart';

abstract interface class AuthRemoteDataSource {
  Future<Result<AuthResponse>> login({
    required String email,
    required String password,
  });

  Future<Result<AuthResponse>> register({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  });
}



