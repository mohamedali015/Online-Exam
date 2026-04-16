import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/data/model/response/auth_response.dart';
import 'package:online_exam/features/auth/domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_source/remote/auth_remote_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepoImpl(this._authRemoteDataSource);
  @override
  Future<Result<AuthEntity>> register({
    required String userName,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  }) async {
    final response = await _authRemoteDataSource.register(
      userName: userName,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      phone: phone,
    );

    switch (response) {
      case Success<AuthResponse>():
        return Success(data: response.data.toEntity());
      case Failure<AuthResponse>():
        return Failure(errorMessage: response.errorMessage);
    }
  }

  @override
  Future<Result<AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    final response = await _authRemoteDataSource.login(
      email: email,
      password: password,
    );
    switch (response) {
      case Success<AuthResponse>():
        {
          return Success(data: response.data.toEntity());
        }
      case Failure<AuthResponse>():
        {
          return Failure(errorMessage: response.errorMessage);
        }
    }
  }
}