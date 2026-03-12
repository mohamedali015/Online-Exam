import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/forget_password/data/models/responses/enter_email_response/enter_email_response.dart';

abstract interface class ForgetPasswordRemoteDataSource {
  Future<Result<EnterEmailResponse>> enterEmail({required String email});
}
