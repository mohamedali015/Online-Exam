import 'package:injectable/injectable.dart';
import 'package:online_exam/config/user/domain/repositories/user_repo.dart';

import '../../../../features/auth/domain/entities/user_entity.dart';
import '../../../error_handling/result.dart';

@injectable
class GetUserDataUseCase {
  final UserRepo _repo;

  GetUserDataUseCase(this._repo);

  Future<Result<UserEntity>> call() {
    return _repo.getUserData();
  }
}
