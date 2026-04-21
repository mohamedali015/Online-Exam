import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/profile/domain/entities/update_profile_entity.dart';
import 'package:online_exam/features/profile/domain/repositories/update_profile_repo.dart';

@injectable
class UpdateProfileUseCase {
  UpdateProfileRepo updateProfileRepo;
  UpdateProfileUseCase(this.updateProfileRepo);

  Future<Result<UpdateProfileEntity>> call({
    required Map<String, dynamic> body,
  }) async {
    return await updateProfileRepo.updateUserData(body);
  }
}
