import 'package:online_exam/features/exam/domain/entities/questions_entity.dart';

import '../../../../config/error_handling/result.dart';

abstract interface class ExamRepo {
  Future<Result<List<QuestionsEntity>>> getExamQuestions({
    required String examId,
  });
}
