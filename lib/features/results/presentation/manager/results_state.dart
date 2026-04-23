import 'package:online_exam/config/base_state/base_state.dart';

import '../../../exam/domain/entities/exam_result_entity.dart';

class ResultsState {
  final BaseState<Map<String, List<ExamResultEntity>>> resultsState;

  ResultsState({BaseState<Map<String, List<ExamResultEntity>>>? resultsState})
    : resultsState = resultsState ?? const BaseState();

  ResultsState copyWith({
    BaseState<Map<String, List<ExamResultEntity>>>? resultsStateParam,
  }) {
    return ResultsState(resultsState: resultsStateParam ?? resultsState);
  }
}
