import 'package:dio/dio.dart';
import 'package:online_exam/features/auth/data/model/request/register_request.dart';
import 'package:online_exam/features/auth/data/model/response/auth_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../config/cache/secure_cache/cache_keys.dart';
import '../../../core/values/api_end_points.dart';
import '../../home/data/model/response/get_all_subjects_response.dart';
import '../data/model/request/login_request.dart';

part 'api_client_auth.g.dart';

@injectable
@RestApi()
abstract class ApiClientAuth {
  @factoryMethod
  factory ApiClientAuth(Dio dio) = _ApiClientAuth;

  @POST(ApiEndPoints.register)
  @Extra({ApiStrings.requireAuth: false})
  Future<AuthResponse> register(@Body() RegisterRequest request);
  ////////////////// Login //////////////////
  @POST(ApiEndPoints.login)
  @Extra({ApiStrings.requireAuth: false})
  Future<AuthResponse> login(@Body() LoginRequest login);
}
