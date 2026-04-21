import 'package:online_exam/config/error_handling/result.dart';
import '../model/response/get_all_subjects_response.dart';

abstract interface class GetAllSubjectsDataSource {
  Future<Result<GetAllSubjectsResponse>> getSubjects();
}
