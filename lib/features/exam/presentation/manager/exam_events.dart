sealed class ExamEvents {}

class GetExamQuestions extends ExamEvents {}

class NextQuestion extends ExamEvents {}

class PreviousQuestion extends ExamEvents {}

class SelectAnswer extends ExamEvents {
  final int questionIndex;
  final String answer;

  SelectAnswer({required this.questionIndex, required this.answer});
}

class FinishExam extends ExamEvents {}
