import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/values/api_end_points.dart';
import 'package:online_exam/core/values/api_strings.dart';
import 'package:online_exam/features/exams/data/model/response/exams_response.dart';
import 'package:retrofit/retrofit.dart';

part 'exams_api_client.g.dart';

@injectable
@RestApi()
abstract class ExamsApiClient {
  @factoryMethod
  factory ExamsApiClient(Dio dio) = _ExamsApiClient;

  @GET(ApiEndPoints.getSubjectExams)
  Future<ExamsResponse> getSubjectExams(
    @Query(ApiStrings.subject) String subjectId,
  );
}
