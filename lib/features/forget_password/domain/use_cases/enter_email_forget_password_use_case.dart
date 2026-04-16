import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/forget_password/domain/repositories/forget_password_repo.dart';

@injectable
class EnterEmailUseCase {
  ForgetPasswordRepo repo;

  EnterEmailUseCase(this.repo);

  Future<Result<bool>> call({required String email}) {
    return repo.enterEmail(email: email);
  }
}
