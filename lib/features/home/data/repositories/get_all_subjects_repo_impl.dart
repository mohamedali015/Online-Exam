import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/home/data/model/response/get_all_subjects_response.dart';
import 'package:online_exam/features/home/data/mappers/subject_response_mapper.dart';
import '../../domain/entities/get_all_subjects_entity.dart';
import '../../domain/repositories/get_all_subjects_repo.dart';
import '../data_source/get_all_subjects_remote_data_source.dart';

@Injectable(as: SubjectsRepository)
class SubjectsRepositoryImpl implements SubjectsRepository {
  final GetAllSubjectsDataSource _dataSource;
  SubjectsRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<SubjectEntity>>> getAllSubjects() async {
    final response = await _dataSource.getSubjects();

    switch (response) {
      case Success<GetAllSubjectsResponse>():
        final subjects = response.data.subjects ?? [];

        return Success(data: subjects.map((e) => e.toEntity()).toList());

      case Failure<GetAllSubjectsResponse>():
        return Failure(errorMessage: response.errorMessage);
    }
  }
}
