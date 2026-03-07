import 'package:dio/dio.dart';

class NetworkException {
  static String getMessageError(Exception exception) {
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          return 'errors.connectionTimeout';
        case DioExceptionType.sendTimeout:
          return 'errors.sendTimeout';
        case DioExceptionType.receiveTimeout:
          return 'errors.receiveTimeout';
        case DioExceptionType.badCertificate:
          return 'errors.badCertificate';
        case DioExceptionType.badResponse:
          return _handleMessageResponse(exception);
        case DioExceptionType.cancel:
          return 'errors.cancel';
        case DioExceptionType.connectionError:
          return 'errors.connectionError';
        case DioExceptionType.unknown:
          return 'errors.unknown';
      }
    } else {
      return exception.toString();
    }
  }

  static String _handleMessageResponse(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final data = e.response!.data;

      switch (statusCode) {
        case 400:
          return 'errors.error400';
        case 401:
          return 'errors.error401${data['error']}';
        case 403:
          return 'errors.error403';
        case 404:
          return 'errors.error404';
        case 408:
          return 'errors.error408';
        case 429:
          return 'errors.error429';
        case 500:
          return 'errors.error500';
        case 502:
          return 'errors.error502';
        case 503:
          return 'errors.error503';
        case 504:
          return 'errors.error504';
        default:
          if (data is Map && data['error'] != null) {
            return data['error'].toString();
          }
          return 'Server error (${statusCode ?? 'unknown'}). Please try again.';
      }
    }
    return 'errors.defaultError';
  }
}