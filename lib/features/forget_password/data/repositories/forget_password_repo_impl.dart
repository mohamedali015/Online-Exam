import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/forget_password/data/data_sources/remote/forget_password_remote_data_source.dart';
import 'package:online_exam/features/forget_password/data/models/responses/new_password_response/new_password_response.dart';
import 'package:online_exam/features/forget_password/data/models/responses/verify_otp_response/verify_otp_response.dart';

import '../../domain/repositories/forget_password_repo.dart';
import '../models/responses/enter_email_response/enter_email_response.dart';

@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  ForgetPasswordRemoteDataSource remoteDataSource;

  ForgetPasswordRepoImpl(this.remoteDataSource);

  @override
  Future<Result<bool>> enterEmail({required String email}) async {
    final response = await remoteDataSource.enterEmail(email: email);

    switch (response) {
      case Success<EnterEmailResponse>():
        {
          return Success(data: true);
        }
      case Failure<EnterEmailResponse>():
        {
          return Failure(errorMessage: response.errorMessage);
        }
    }
  }

  @override
  Future<Result<bool>> verifyOtp({required String otp}) async {
    final response = await remoteDataSource.verifyOtp(otp: otp);

    switch (response) {
      case Success<VerifyOtpResponse>():
        {
          return Success(data: true);
        }
      case Failure<VerifyOtpResponse>():
        {
          return Failure(errorMessage: response.errorMessage);
        }
    }
  }

  @override
  Future<Result<bool>> getNewPassword({
    required String email,
    required String newPassword,
  }) async {
    final response = await remoteDataSource.getNewPassword(
      email: email,
      newPassword: newPassword,
    );

    switch (response) {
      case Success<NewPasswordResponse>():
        {
          return Success(data: true);
        }
      case Failure<NewPasswordResponse>():
        {
          return Failure(errorMessage: response.errorMessage);
        }
    }
  }
}
