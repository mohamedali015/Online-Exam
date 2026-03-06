import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../Api/api_client.dart';

@module
abstract class ApiModule {

  @lazySingleton
  ApiClient provideApiClient(Dio dio) {
    return ApiClient(dio, baseUrl: '////////////');
  }

  @lazySingleton
  Dio provideDio(BaseOptions option, PrettyDioLogger logger) {
    var dio = Dio(option);
    dio.interceptors.add(logger);
    return dio;
  }

  @lazySingleton
  BaseOptions providerOption() {
    return BaseOptions(
      sendTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    );
  }

  @lazySingleton
  PrettyDioLogger providerDioLogger() {
    return PrettyDioLogger(
        requestBody: true,
        request: true,
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: false,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args){
          // don't print requests with uris containing '/posts'
          if(options.path.contains('/posts')){
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }

    );
  }
}