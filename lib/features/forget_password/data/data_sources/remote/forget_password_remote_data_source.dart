import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/forget_password/data/models/responses/enter_email_response/enter_email_response.dart';
import 'package:online_exam/features/forget_password/data/models/responses/new_password_response/new_password_response.dart';

import '../../models/responses/verify_otp_response/verify_otp_response.dart';

abstract interface class ForgetPasswordRemoteDataSource {
  Future<Result<EnterEmailResponse>> enterEmail({required String email});

  Future<Result<VerifyOtpResponse>> verifyOtp({required String otp});

  Future<Result<NewPasswordResponse>> getNewPassword({
    required String email,
    required String newPassword,
  });
}
