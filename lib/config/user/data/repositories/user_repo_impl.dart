import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/config/user/data/models/responses/get_user_response/get_user_data_response.dart';
import 'package:online_exam/config/user/domain/repositories/user_repo.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';

import '../data_sources/remote/user_remote_data_source.dart';

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
          return Success(response.data.user!.toUserEntity());
        }
      case Failure<GetUserDataResponse>():
        {
          return Failure(response.errorMessage);
        }
    }
  }
}
