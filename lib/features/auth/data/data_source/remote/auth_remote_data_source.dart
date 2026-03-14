import 'package:online_exam/config/error_handling/result.dart';

import '../../model/response/auth_response.dart';

abstract interface class AuthRemoteDataSource {
  Future<Result<AuthResponse>> login({
    required String email,
    required String password,
  });
}
