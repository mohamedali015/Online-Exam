import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/forget_password/api/forget_password_api_client/forget_password_api_client.dart';

import 'package:online_exam/features/forget_password/data/models/responses/enter_email_response/enter_email_response.dart';
import 'package:online_exam/features/forget_password/data/models/responses/new_password_response/new_password_response.dart';
import 'package:online_exam/features/forget_password/data/models/responses/verify_otp_response/verify_otp_response.dart';

import '../../../../../config/error_handling/execute_api.dart';
import '../../../data/data_sources/remote/forget_password_remote_data_source.dart';
import '../../../data/models/requests/enter_email_request.dart';
import '../../../data/models/requests/new_password_request.dart';
import '../../../data/models/requests/verify_otp_request.dart';

@Injectable(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  ForgetPasswordApiClient apiClient;

  ForgetPasswordRemoteDataSourceImpl(this.apiClient);

  @override
  Future<Result<EnterEmailResponse>> enterEmail({required String email}) async {
    return executeApi(() async {
      final request = EnterEmailRequest(email: email);
      return await apiClient.enterEmail(request);
    });
  }

  @override
  Future<Result<VerifyOtpResponse>> verifyOtp({required String otp}) {
    return executeApi(() async {
      final request = VerifyOtpRequest(resetCode: otp);
      return await apiClient.verifyOtp(request);
    });
  }

  @override
  Future<Result<NewPasswordResponse>> getNewPassword({
    required String email,
    required String newPassword,
  }) {
    return executeApi(() async {
      final request = NewPasswordRequest(
          email: email, newPassword: newPassword);
      return await apiClient.getNewPassword(request);
    });
  }
}
