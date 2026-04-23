import 'package:injectable/injectable.dart';

import '../../../../config/error_handling/result.dart';
import '../entities/change_password_entity.dart';
import '../repositories/user_repo.dart';

@injectable
class ChangePasswordUseCase {
  final UserRepo _userRepo;

  ChangePasswordUseCase(this._userRepo);

  Future<Result<ChangePasswordEntity>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  }) async {
    return await _userRepo.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      rePassword: rePassword,
    );
  }
}
