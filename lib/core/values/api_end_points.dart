abstract class ApiEndPoints {
  static const String baseUrl = "https://exam.elevateegy.com/api/v1";
  static const String login = "$baseUrl/auth/signin";
  static const String register = "/auth/signup";
  static const String enterEmail = '$baseUrl/auth/forgotPassword';
  static const String verifyOtp = '$baseUrl/auth/verifyResetCode';
  static const String getNewPassword = '$baseUrl/auth/resetPassword';
}
