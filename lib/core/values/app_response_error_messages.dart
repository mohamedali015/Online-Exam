abstract class AppResponseErrorMessages {
  AppResponseErrorMessages._();

  static const String connectionTimeoutMessage =
      'Connection timeout.\nPlease check your internet connection and try again.';

  static const String sendTimeoutMessage =
      'Request took too long to send.\nPlease try again.';

  static const String receiveTimeoutMessage =
      'Server took too long to respond.\nPlease try again later.';

  static const String badCertificateMessage =
      'Security certificate error.\nPlease try again later.';

  static const String requestCancelledMessage = 'Request was cancelled.';

  static const String connectionErrorMessage =
      'No internet connection.\nPlease check your network.';

  static const String unknownErrorMessage =
      'Something went wrong.\nPlease try again.';

  static const String unexpectedErrorMessage =
      'Unexpected error occurred.\nPlease try again.';
}
