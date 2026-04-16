import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/error_handling/result.dart';
import '../../../../core/values/app_strings.dart';
import '../../domain/entities/get_all_subjects_entity.dart';
import '../../domain/use_case/get_all_subjects_use_case.dart';
import 'all_subjects_event.dart';
import 'all_subjects_state.dart';

@injectable
class SubjectsCubit extends Cubit<SubjectsState> {

  final GetAllSubjectsUseCase _getAllSubjectsUseCase;
  SubjectsCubit(this._getAllSubjectsUseCase) : super(const SubjectsState());

  void doEvent(AllSubjectsEvent event) {
    switch (event) {
      case GetAllSubjectsEvent():
        _getSubjects();
        break;

      case GetSearchSubjectsEvent():
        _searchSubjects(event.query);
        break;
    }
  }

  Future<void> _getSubjects() async {
    emit(state.copyWith(isLoading: true));

    final result = await _getAllSubjectsUseCase.getSubjects();

    switch (result) {
      case Success<List<SubjectEntity>>():
        emit(
          state.copyWith(
            isLoading: false,
            allSubjects: result.data,
            subjects: result.data,
            errorMessage: null,
          ),
        );

      case Failure<List<SubjectEntity>>():
        emit(
          state.copyWith(isLoading: false, errorMessage: result.errorMessage),
        );
    }
  }

  void _searchSubjects(String query) async {
    final all = state.allSubjects;

    final filtered = query.isEmpty
        ? all
        : all
              .where(
                (e) => (e.name ?? AppStrings.noNameFound)
                    .toLowerCase()
                    .contains(query.toLowerCase()),
              )
              .toList();

    emit(state.copyWith(subjects: List<SubjectEntity>.from(filtered)));
  }
}
