import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/profile/data/models/responses/update_user_response/updated_user.dart';

abstract interface class UpdateProfileRemoteDataSource {
  Future<Result<UpdatedUser>> updateUserData(Map<String, dynamic> body);
}
