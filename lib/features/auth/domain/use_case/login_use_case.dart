import 'package:injectable/injectable.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repo.dart';
import '../../../../config/error_handling/result.dart';
import '../entities/auth_entity.dart';

@injectable
class LoginUseCase {
  final AuthRepo _authRepo;

  LoginUseCase(this._authRepo);

  Future<Result<AuthEntity>> call({
    required String email,
    required String password,
  }) {
    return _authRepo.login(email: email, password: password);
  }
}
