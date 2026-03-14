import 'package:injectable/injectable.dart';

import '../../../../config/error_handling/result.dart';
import '../repositories/forget_password_repo.dart';

@injectable
class VerifyOtpForgetPasswordUseCase {
  ForgetPasswordRepo repo;

  VerifyOtpForgetPasswordUseCase(this.repo);

  Future<Result<bool>> call({required String otp}) {
    return repo.verifyOtp(otp: otp);
  }
}
