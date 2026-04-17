abstract class ApiEndPoints {
  static const String baseUrl = "https://exam.elevateegy.com/api/v1";

  static const String getSubjectExams = '$baseUrl/exams';
  static const String getUserData = '$baseUrl/auth/profileData';
  static const String getExamQuestions = '$baseUrl/questions';
  static const String login = "/auth/signin";
  static const String register = "/auth/signup";
  static const String enterEmail = 'auth/forgotPassword';
  static const String verifyOtp = 'auth/verifyResetCode';
  static const String getNewPassword = 'auth/resetPassword';
}
