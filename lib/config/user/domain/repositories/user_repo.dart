import 'package:online_exam/config/error_handling/result.dart';

import '../../../../features/auth/domain/entities/user_entity.dart';

abstract interface class UserRepo {
  Future<Result<UserEntity>> getUserData();
}
