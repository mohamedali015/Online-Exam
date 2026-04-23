import 'package:online_exam/config/error_handling/result.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../entities/change_password_entity.dart';
import '../../../../features/auth/domain/entities/user_entity.dart';

abstract interface class UserRepo {
  Future<Result<UserEntity>> getUserData();

  ///? Change password
  Future<Result<ChangePasswordEntity>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  });
}
