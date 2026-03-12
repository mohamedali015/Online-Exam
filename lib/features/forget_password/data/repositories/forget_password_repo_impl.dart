import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/forget_password/data/data_sources/remote/forget_password_remote_data_source.dart';

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
          return Success(true);
        }
      case Failure<EnterEmailResponse>():
        {
          return Failure(response.errorMessage);
        }
    }
  }

  @override
  Future<Result<bool>> getNewPassword({
    required String email,
    required String newPassword,
  }) {
    // TODO: implement getNewPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<bool>> verifyOtp({required String otp}) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
