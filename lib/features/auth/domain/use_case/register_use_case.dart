import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/domain/entities/auth_entity.dart';
import 'package:online_exam/features/auth/domain/repositories/auth_repo.dart';

@injectable
class RegisterUseCase {
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);

  Future<Result<AuthEntity>> call({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  }) async {
    return await authRepo.register(
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      phone: phone,
    );
  }
}
