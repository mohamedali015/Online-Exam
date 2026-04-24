import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam/features/profile/data/models/update_profile_request.dart';

abstract interface class ProfileRepo {
  Future<Result<UserEntity>> updateUserData(UpdateProfileRequest request);
}
