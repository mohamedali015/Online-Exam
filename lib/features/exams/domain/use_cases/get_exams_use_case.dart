import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/repositories/exams_repo.dart';

@injectable
class GetExamsUseCase {
  GetExamsUseCase(this.examsRepo);
  ExamsRepo examsRepo;

  Future<Result<List<ExamsModel>>> call({required String subjectId}) async {
    return await examsRepo.getSubjectExams(subjectId: subjectId);
  }
}
