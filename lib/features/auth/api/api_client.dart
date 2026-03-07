import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../core/values/api_end_points.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiEndPoints.baseUrl)
abstract interface class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

}