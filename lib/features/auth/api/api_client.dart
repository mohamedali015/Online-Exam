import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../core/values/api_end_points.dart';
import '../data/model/request/login_request.dart';
import '../data/model/response/auth_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract interface class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  ////////////////// Login //////////////////
  @POST(ApiEndPoints.login)
  Future<AuthResponse> login(@Body() LoginRequest login);
}
