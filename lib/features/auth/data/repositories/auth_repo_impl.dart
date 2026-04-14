import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/data/model/response/auth_response.dart';
import 'package:online_exam/features/auth/domain/entities/auth_entity.dart';
import '../../../../config/cache/secure_cache/cache_keys.dart';
import '../../../../config/cache/secure_cache/secure_cache_helper.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_source/remote/auth_remote_data_source.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(
      this._authRemoteDataSource,
      );

  @override
  Future<Result<AuthEntity>> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    final response = await _authRemoteDataSource.login(
      email: email,
      password: password,
    );

    switch (response) {
      case Success<AuthResponse>():
        {
          final entity = response.data.toEntity();

          if (rememberMe && entity.token != null) {
            await SecureCacheHelper.saveData(
              key: CacheKeys.token,
              value: entity.token!,
            );
          }

          return Success(entity);
        }

      case Failure<AuthResponse>():
        {
          return Failure(response.errorMessage);
        }
    }
  }
}

