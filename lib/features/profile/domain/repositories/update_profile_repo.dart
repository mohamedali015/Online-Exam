import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/profile/domain/entities/update_profile_entity.dart';

abstract interface class UpdateProfileRepo {
  Future<Result<UpdateProfileEntity>> updateUserData(Map<String, dynamic> body);
}
