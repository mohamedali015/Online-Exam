import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exams/domain/entities/exam_entity.dart';
import 'package:online_exam/features/exams/domain/repositories/exams_repo.dart';

@injectable
class GetExamsUseCase {
  GetExamsUseCase(this.examsRepo);
  ExamsRepo examsRepo;

  Future<Result<List<ExamEntity>>> call({required String subjectId}) {
    return examsRepo.getSubjectExams(subjectId: subjectId);
  }
}
