import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/values/api_end_points.dart';
import '../../data/models/requests/enter_email_request/enter_email_request.dart';
import '../../data/models/responses/enter_email_response/enter_email_response.dart';

part 'forget_password_api_client.g.dart';

@injectable
@RestApi()
abstract class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio) = _ForgetPasswordApiClient;

  @POST(ApiEndPoints.enterEmail)
  Future<EnterEmailResponse> enterEmail(@Body() EnterEmailRequest request);
}
