import 'package:online_exam/features/home/domain/entities/get_all_subjects_entity.dart';

sealed class ExamsEvents {}

class GetSubjectExams extends ExamsEvents {
  final SubjectEntity subject;

  GetSubjectExams({required this.subject});
}
