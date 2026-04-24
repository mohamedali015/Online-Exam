import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam/features/profile/data/data_sources/remote/profile_remote_data_source.dart';
import 'package:online_exam/features/profile/data/models/responses/update_user_response/updated_user_data.dart';
import 'package:online_exam/features/profile/data/models/update_profile_request.dart';
import 'package:online_exam/features/profile/domain/repositories/profile_repo.dart';

import '../../../../config/cache/secure_cache/cache_keys.dart';
import '../../../../config/cache/secure_cache/secure_cache_helper.dart';
import '../../domain/entities/change_password_entity.dart';
import '../mappers/change_password_mapper.dart';
import '../models/responses/change_password/change_password_response.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepoImpl(this._profileRemoteDataSource);

  @override
  Future<Result<UserEntity>> updateUserData(
    UpdateProfileRequest request,
  ) async {
    final response = await _profileRemoteDataSource.updateUserData(request);

    switch (response) {
      case Success<UpdatedUserData>():
        return Success(data: response.data.toEntity());

      case Failure<UpdatedUserData>():
        return Failure(errorMessage: response.errorMessage);
    }
  }

  ///? Change password
  @override
  Future<Result<ChangePasswordEntity>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  }) async {
    final response = await _profileRemoteDataSource.changePassword(
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
