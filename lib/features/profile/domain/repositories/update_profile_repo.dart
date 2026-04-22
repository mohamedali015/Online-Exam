import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';

abstract interface class UpdateProfileRepo {
  Future<Result<UserEntity>> updateUserData(Map<String, dynamic> body);
}
