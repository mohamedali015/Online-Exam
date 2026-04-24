import 'package:online_exam/config/base_state/base_state.dart';

import '../../domain/entities/questions_entity.dart';

class ExamState {
  BaseState<List<QuestionsEntity>> examState;
  int currentPage;
  bool isSaved;

  ExamState({
    BaseState<List<QuestionsEntity>>? examState,
    this.currentPage = 0,
    this.isSaved = false,
  }) : examState = examState ?? BaseState();

  ExamState copyWith({
    BaseState<List<QuestionsEntity>>? examStateParam,
    int? currentPageParam,
    bool? isSavedParam,
  }) {
    return ExamState(
      examState: examStateParam ?? examState,
      currentPage: currentPageParam ?? currentPage,
      isSaved: isSavedParam ?? isSaved,
    );
  }
}
