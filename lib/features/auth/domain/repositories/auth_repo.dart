import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/domain/entities/auth_entity.dart';

abstract interface class AuthRepo {
  Future<Result<AuthEntity>> register({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  });
}
