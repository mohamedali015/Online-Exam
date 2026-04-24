import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/error_handling/result.dart';
import '../../../exam/domain/entities/exam_result_entity.dart';
import '../../domain/use_cases/get_all_results_use_case.dart';
import 'results_events.dart';
import 'results_state.dart';

@injectable
class ResultsCubit extends Cubit<ResultsState> {
  final GetAllResultsUseCase getAllResultsUseCase;

  ResultsCubit(this.getAllResultsUseCase) : super(ResultsState());

  void doEvent(ResultsEvent event) {
    switch (event) {
      case GetResults():
        _getResults();
        break;
    }
  }

  Future<void> _getResults() async {
    emit(
      state.copyWith(
        resultsStateParam: state.resultsState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
        ),
      ),
    );

    final result = await getAllResultsUseCase();

    switch (result) {
      case Success():
        final grouped = _groupBySubject(result.data);

        emit(
          state.copyWith(
            resultsStateParam: state.resultsState.copyWith(
              isLoadingParam: false,
              isSuccessParam: true,
              dataParam: grouped,
            ),
          ),
        );
        break;

      case Failure():
        emit(
          state.copyWith(
            resultsStateParam: state.resultsState.copyWith(
              isLoadingParam: false,
              errorMessageParam: result.errorMessage,
            ),
          ),
        );
        break;
    }
  }

  Map<String, List<ExamResultEntity>> _groupBySubject(
    List<ExamResultEntity> results,
  ) {
    final Map<String, List<ExamResultEntity>> grouped = {};

    for (var result in results) {
      final subject = result.exam.subjectName;

      grouped.putIfAbsent(subject, () => []);
      grouped[subject]!.add(result);
    }

    return grouped;
  }
}
