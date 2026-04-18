import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/auth/data/model/request/register_request.dart';
import 'package:online_exam/features/auth/data/model/response/auth_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../core/values/api_end_points.dart';
import '../data/model/request/login_request.dart';

part 'api_client_auth.g.dart';

@RestApi()
abstract class ApiClientAuth {
  @factoryMethod
  factory ApiClientAuth(Dio dio, {String? baseUrl}) = _ApiClientAuth;

  @POST(ApiEndPoints.register)
  Future<AuthResponse> register(@Body() RegisterRequest request);
  ////////////////// Login //////////////////
  @POST(ApiEndPoints.login)
  Future<AuthResponse> login(@Body() LoginRequest login);
}
