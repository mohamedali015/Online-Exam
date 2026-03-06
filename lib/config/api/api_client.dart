import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '')
abstract interface class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;




}