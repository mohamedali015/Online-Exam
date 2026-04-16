import 'package:injectable/injectable.dart';
import 'package:online_exam/features/forget_password/domain/repositories/forget_password_repo.dart';

import '../../../../config/error_handling/result.dart';

@injectable
class GetNewPasswordForgetPasswordUseCase {
  ForgetPasswordRepo repo;

  GetNewPasswordForgetPasswordUseCase(this.repo);

  Future<Result<bool>> call({
    required String email,
    required String newPassword,
  }) {
    return repo.getNewPassword(email: email, newPassword: newPassword);
  }
}
