import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam/features/profile/data/data_sources/remote/profile_remote_data_source.dart';
import 'package:online_exam/features/profile/data/models/responses/update_user_response/updated_user_data.dart';
import 'package:online_exam/features/profile/data/models/update_profile_request.dart';
import 'package:online_exam/features/profile/domain/repositories/profile_repo.dart';

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
}
