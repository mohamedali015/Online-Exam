import 'package:online_exam/config/error_handling/result.dart';
import '../entities/get_all_subjects_entity.dart';


abstract interface class SubjectsRepository {
  Future<Result<List<SubjectEntity>>> getAllSubjects();
}