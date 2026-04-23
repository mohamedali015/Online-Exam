import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
import 'package:online_exam/features/exams/domain/use_cases/get_exams_use_case.dart';
import 'package:online_exam/features/exams/presentation/manager/exams_cubit/exams_events.dart';
import 'package:online_exam/features/exams/presentation/manager/exams_cubit/exams_states.dart';
import 'package:online_exam/features/home/domain/entities/get_all_subjects_entity.dart';

@injectable
class ExamsCubit extends Cubit<ExamsState> {
  ExamsCubit(this._getExamsUseCase) : super(ExamsInitial());

  void doEvent(ExamsEvents event) {
    switch (event) {
      case GetSubjectExams():
        _getSubjectExams(event.subject);
        break;
    }
  }

  final GetExamsUseCase _getExamsUseCase;

  Future<void> _getSubjectExams(SubjectEntity subject) async {
    emit(ExamsLoading());

    final response = await _getExamsUseCase(subjectId: subject.id!);

    switch (response) {
      case Success<List<ExamsModel>>(data: final data):
        final updatedExams = data.map((exam) {
          return exam.copyWith(
            subjectNameParam: subject.name,
            iconParam: subject.icon,
          );
        }).toList();

        emit(ExamsSuccessState(updatedExams));
        break;

      case Failure<List<ExamsModel>>():
        emit(ExamsErrorState(response.errorMessage));
    }
  }
}
