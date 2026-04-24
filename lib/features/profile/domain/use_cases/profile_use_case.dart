import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam/features/profile/data/models/update_profile_request.dart';
import 'package:online_exam/features/profile/domain/repositories/profile_repo.dart';

@injectable
class ProfileUseCase {
  ProfileRepo profileRepo;
  ProfileUseCase(this.profileRepo);

  Future<Result<UserEntity>> call({
    required UpdateProfileRequest request,
  }) async {
    return await profileRepo.updateUserData(request);
  }
}
