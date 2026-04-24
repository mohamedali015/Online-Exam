import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/profile/data/models/responses/update_user_response/update_profile_response.dart';
import 'package:online_exam/features/profile/data/models/update_profile_request.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

import '../../../../core/values/api_end_points.dart';
import '../../data/models/request/change_password/change_password_request.dart';
import '../../data/models/responses/change_password/change_password_response.dart';

part 'profile_api_client.g.dart';

@injectable
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;

  @PUT(ApiEndPoints.editProfile)
  Future<UpdateProfileResponse> updateUserData(
    @Body() UpdateProfileRequest request,
  );

  @PATCH(ApiEndPoints.changePassword)
  Future<ChangePasswordResponse> changePassword(
    @Body() ChangePasswordRequest changePasswordRequest,
  );
}
