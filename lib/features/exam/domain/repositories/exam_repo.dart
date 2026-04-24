import 'package:online_exam/features/exam/domain/entities/questions_entity.dart';

import '../../../../config/error_handling/result.dart';
import '../entities/exam_result_entity.dart';

abstract interface class ExamRepo {
  Future<Result<List<QuestionsEntity>>> getExamQuestions({
    required String examId,
  });

  Future<Result<bool>> saveExamResult(ExamResultEntity examResult);
}
