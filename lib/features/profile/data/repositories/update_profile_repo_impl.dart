import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/profile/data/data_sources/remote/update_profile_remote_data_source.dart';
import 'package:online_exam/features/profile/data/models/responses/update_user_response/updated_user.dart';
import 'package:online_exam/features/profile/domain/entities/update_profile_entity.dart';
import 'package:online_exam/features/profile/domain/repositories/update_profile_repo.dart';

@Injectable(as: UpdateProfileRepo)
class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final UpdateProfileRemoteDataSource _updateProfileRemoteDataSource;

  UpdateProfileRepoImpl(this._updateProfileRemoteDataSource);

  @override
  Future<Result<UpdateProfileEntity>> updateUserData(
    Map<String, dynamic> body,
  ) async {
    final response = await _updateProfileRemoteDataSource.updateUserData(body);

    switch (response) {
      case Success<UpdatedUser>():
        return Success(data: response.data.toEntity());

      case Failure<UpdatedUser>():
        return Failure(errorMessage: response.errorMessage);
    }
  }
}
