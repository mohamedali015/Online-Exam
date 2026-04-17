import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/values/api_end_points.dart';
import '../../data/models/responses/exam_questions_response/exam_questions_response.dart';

part 'exam_api_client.g.dart';

@injectable
@RestApi()
abstract class ExamApiClient {
  @factoryMethod
  factory ExamApiClient(Dio dio) = _ExamApiClient;

  @GET(ApiEndPoints.getExamQuestions)
  Future<ExamQuestionsResponse> getExamQuestions(
    @Query('exam') String examId,
    @Header('token') String token,
  );
}
