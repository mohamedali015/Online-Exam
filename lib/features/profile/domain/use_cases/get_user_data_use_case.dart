import 'package:injectable/injectable.dart';
import 'package:online_exam/features/profile/domain/repositories/user_repo.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../../config/error_handling/result.dart';

@injectable
class GetUserDataUseCase {
  final UserRepo _repo;

  GetUserDataUseCase(this._repo);

  Future<Result<UserEntity>> call() {
    return _repo.getUserData();
  }
}
