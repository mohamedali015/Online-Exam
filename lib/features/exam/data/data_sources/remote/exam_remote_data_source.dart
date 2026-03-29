import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exam/data/models/responses/exam_questions_response/exam_questions_response.dart';

abstract interface class ExamRemoteDataSource {
  Future<Result<ExamQuestionsResponse>> getExamQuestions({
    required String examId,
  });
}
