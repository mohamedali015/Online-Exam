sealed class ExamsEvents {}

class GetSubjectExams extends ExamsEvents {
  final String subjectId;

  GetSubjectExams({required this.subjectId});
}
