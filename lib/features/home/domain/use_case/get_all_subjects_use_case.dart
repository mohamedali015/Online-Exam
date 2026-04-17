import 'package:injectable/injectable.dart';
import '../../../../config/error_handling/result.dart';
import '../entities/get_all_subjects_entity.dart';
import '../repositories/get_all_subjects_repo.dart';

@injectable
class GetAllSubjectsUseCase {

  final SubjectsRepository _repository;
  GetAllSubjectsUseCase(this._repository);

  Future<Result<List<SubjectEntity>>> getSubjects() {
    return _repository.getAllSubjects();
  }
}