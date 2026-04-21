import 'package:injectable/injectable.dart';
import 'package:online_exam/features/exam/domain/repositories/exam_repo.dart';

import '../../../../config/error_handling/result.dart';
import '../entities/questions_entity.dart';

@injectable
class GetExamQuestionsUseCase {
  final ExamRepo _examRepo;

  GetExamQuestionsUseCase(this._examRepo);

  Future<Result<List<QuestionsEntity>>> call({required String examId}) {
    return _examRepo.getExamQuestions(examId: examId);
  }
}
