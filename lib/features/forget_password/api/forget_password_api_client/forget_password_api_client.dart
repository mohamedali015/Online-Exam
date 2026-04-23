import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/forget_password/data/models/requests/new_password_request.dart';
import 'package:online_exam/features/forget_password/data/models/requests/verify_otp_request.dart';
import 'package:online_exam/features/forget_password/data/models/responses/new_password_response/new_password_response.dart';
import 'package:online_exam/features/forget_password/data/models/responses/verify_otp_response/verify_otp_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/values/api_end_points.dart';
import '../../../../core/values/api_strings.dart';
import '../../data/models/requests/enter_email_request.dart';
import '../../data/models/responses/enter_email_response/enter_email_response.dart';

part 'forget_password_api_client.g.dart';

@injectable
@RestApi()
abstract class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio) = _ForgetPasswordApiClient;

  @POST(ApiEndPoints.enterEmail)
  @Extra({ApiStrings.requireAuth: false})
  Future<EnterEmailResponse> enterEmail(@Body() EnterEmailRequest request);

  @POST(ApiEndPoints.verifyOtp)
  @Extra({ApiStrings.requireAuth: false})
  Future<VerifyOtpResponse> verifyOtp(@Body() VerifyOtpRequest request);

  @PUT(ApiEndPoints.getNewPassword)
  @Extra({ApiStrings.requireAuth: false})
  Future<NewPasswordResponse> getNewPassword(
    @Body() NewPasswordRequest request,
  );
}
