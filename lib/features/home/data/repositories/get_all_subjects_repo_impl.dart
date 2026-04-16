import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/home/data/model/response/get_all_subjects_response.dart';
import 'package:online_exam/features/home/data/mappers/subject_response_mapper.dart';
import '../../../../config/cache/secure_cache/cache_keys.dart';
import '../../../../config/cache/secure_cache/secure_cache_helper.dart';
import '../../domain/entities/get_all_subjects_entity.dart';
import '../../domain/repositories/get_all_subjects_repo.dart';
import '../data_source/get_all_subjects_remote_data_source.dart';

@Injectable(as: SubjectsRepository)
class SubjectsRepositoryImpl implements SubjectsRepository {
  @factoryMethod
  final GetAllSubjectsDataSource _dataSource;
  SubjectsRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<SubjectEntity>>> getAllSubjects() async {
    final token = await SecureCacheHelper.getData(key: CacheKeys.token);
    final response = await _dataSource.getSubjects(token: token!);

    switch (response) {
      case Success<GetAllSubjectsResponse>():
        final subjects = response.data.subjects ?? [];

        return Success(subjects.map((e) => e.toEntity()).toList());

      case Failure<GetAllSubjectsResponse>():
        return Failure(response.errorMessage);
    }
  }
}
