import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/values/api_end_points.dart';
import '../../data/model/response/get_all_subjects_response.dart';
part 'all_subjects_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class AllSubjectsApiClient {
  @factoryMethod
  factory AllSubjectsApiClient(Dio dio) = _AllSubjectsApiClient;

  ///////////////////// Get All Subjects //////////////////
  @GET(ApiEndPoints.getAllSubjects)
  Future<GetAllSubjectsResponse> getAllSubjects();
}
