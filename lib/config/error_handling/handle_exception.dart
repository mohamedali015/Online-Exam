import 'package:dio/dio.dart';

import '../../core/values/app_response_error_messages.dart';

class NetworkException {
  static String getMessageError(Exception exception) {
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          return AppResponseErrorMessages.connectionTimeoutMessage;

        case DioExceptionType.sendTimeout:
          return AppResponseErrorMessages.sendTimeoutMessage;

        case DioExceptionType.receiveTimeout:
          return AppResponseErrorMessages.receiveTimeoutMessage;

        case DioExceptionType.badCertificate:
          return AppResponseErrorMessages.badCertificateMessage;

        case DioExceptionType.badResponse:
          return _handleMessageResponse(exception);

        case DioExceptionType.cancel:
          return AppResponseErrorMessages.requestCancelledMessage;

        case DioExceptionType.connectionError:
          return AppResponseErrorMessages.connectionErrorMessage;

        case DioExceptionType.unknown:
          return AppResponseErrorMessages.unknownErrorMessage;
      }
    } else {
      return AppResponseErrorMessages.unexpectedErrorMessage;
    }
  }

  static String _handleMessageResponse(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final data = e.response!.data;

      if (data is Map<String, dynamic>) {
        if (data['message'] != null) {
          return data['message'].toString();
        }
        if (data['error'] != null) {
          return data['error'].toString();
        }
      }

      switch (statusCode) {
        case 400:
          return 'errors.error400';
        case 401:
          return 'errors.error401';
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
          return 'Server error (${statusCode ?? 'unknown'}). Please try again.';
      }
    }

    return 'errors.defaultError';
  }
}