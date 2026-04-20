import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/profile/data/models/responses/get_user_response/get_user_data_response.dart';

abstract interface class UserRemoteDataSource {
  Future<Result<GetUserDataResponse>> getUserData();
}
