import 'package:online_exam/config/base_state/base_state.dart';

import '../../domain/entities/questions_entity.dart';

class ExamState {
  BaseState<List<QuestionsEntity>> examState = BaseState();
  int currentPage;


  ExamState(
      {BaseState<List<QuestionsEntity>>? examState, this.currentPage = 0}) {
    this.examState = examState ?? BaseState();
  }

  ExamState copyWith({
    BaseState<List<QuestionsEntity>>? examStateParam,
    int? currentPageParam
  }) {
    return ExamState(
      examState: examStateParam ?? examState,
      currentPage: currentPageParam ?? currentPage,
    );
  }
}
