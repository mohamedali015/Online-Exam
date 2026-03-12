import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/forget_password/api/forget_password_api_client/forget_password_api_client.dart';

import 'package:online_exam/features/forget_password/data/models/responses/enter_email_response/enter_email_response.dart';

import '../../../../../config/error_handling/execute_api.dart';
import '../../../data/data_sources/remote/forget_password_remote_data_source.dart';
import '../../../data/models/requests/enter_email_request/enter_email_request.dart';

@Injectable(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  ForgetPasswordApiClient apiClient;

  ForgetPasswordRemoteDataSourceImpl(this.apiClient);

  @override
  Future<Result<EnterEmailResponse>> enterEmail({required String email}) async {
    return executeApi(() async {
      var request = EnterEmailRequest(email: email);
      return await apiClient.enterEmail(request);
    });
  }
}
