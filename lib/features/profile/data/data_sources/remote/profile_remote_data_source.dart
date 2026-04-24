import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/profile/data/models/responses/update_user_response/updated_user_data.dart';
import 'package:online_exam/features/profile/data/models/update_profile_request.dart';
import '../../models/responses/change_password/change_password_response.dart';

abstract interface class ProfileRemoteDataSource {
  Future<Result<UpdatedUserData>> updateUserData(UpdateProfileRequest request);

  Future<Result<ChangePasswordResponse>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  });
}
