import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/auth/data/model/request/register_request.dart';
import 'package:online_exam/features/auth/data/model/response/auth_response.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../core/values/api_end_points.dart';
import '../../../core/values/api_strings.dart';
import '../data/model/request/login_request.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract interface class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(ApiEndPoints.register)
  @Extra({ApiStrings.requireAuth: false})
  Future<AuthResponse> register(@Body() RegisterRequest request);
  ////////////////// Login //////////////////
  @POST(ApiEndPoints.login)
  @Extra({ApiStrings.requireAuth: false})
  Future<AuthResponse> login(@Body() LoginRequest login);
}
