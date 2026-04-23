import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/config/user/data/models/responses/get_user_response/get_user_data_response.dart';
import 'package:online_exam/config/user/domain/repositories/user_repo.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam/features/profile/data/models/responses/get_user_response/get_user_data_response.dart';
import 'package:online_exam/features/profile/domain/entities/change_password_entity.dart';
import 'package:online_exam/features/profile/domain/repositories/user_repo.dart';

import '../../../../config/cache/secure_cache/cache_keys.dart';
import '../../../../config/cache/secure_cache/secure_cache_helper.dart';
import '../data_sources/remote/user_remote_data_source.dart';
import '../mappers/change_password_mapper.dart';
import '../models/responses/change_password/change_password_response.dart';

@Injectable(as: UserRepo)
class UserRepoImpl implements UserRepo {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepoImpl(this._userRemoteDataSource);

  @override
  Future<Result<UserEntity>> getUserData() async {
    final response = await _userRemoteDataSource.getUserData();

    switch (response) {
      case Success<GetUserDataResponse>():
        {
          return Success(data: response.data.user!.toUserEntity());
        }
      case Failure<GetUserDataResponse>():
        {
          return Failure(errorMessage: response.errorMessage);
        }
    }
  }

  ///? Change password
  @override
  Future<Result<ChangePasswordEntity>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  }) async {
    final response = await _userRemoteDataSource.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      rePassword: rePassword,
    );

    switch (response) {
      case Success<ChangePasswordResponse>():
        final entity = response.data.toEntity();

        if (entity.token != null && entity.token!.isNotEmpty) {
          await SecureCacheHelper.saveData(
            key: CacheKeys.token,
            value: entity.token!,
          );
        }

        return Success(data: entity);

      case Failure<ChangePasswordResponse>():
        return Failure(errorMessage: response.errorMessage);
    }
  }
}
