import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/profile/data/models/responses/update_user_response/update_profile_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

import '../../../../core/values/api_end_points.dart';

part 'update_profile_api_client.g.dart';

@injectable
@RestApi()
abstract class UpdateProfileApiClient {
  @factoryMethod
  factory UpdateProfileApiClient(Dio dio) = _UpdateProfileApiClient;

  @PUT(ApiEndPoints.editProfile)
  Future<UpdateProfileResponse> updateUserData(
    @Body() Map<String, dynamic> body,
  );
}
