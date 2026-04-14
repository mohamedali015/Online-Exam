import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/exam/domain/entities/exam_result_entity.dart';
import 'package:online_exam/features/exam/domain/use_cases/get_exam_questions_use_case.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';

import '../../../../config/error_handling/result.dart';
import '../../domain/entities/questions_entity.dart';
import 'exam_events.dart';
import 'exam_state.dart';

class ExamCubit extends Cubit<ExamState> {
  ExamCubit({required this.getExamQuestionsUseCase, required this.exam})
    : super(ExamState());

  static ExamCubit get(BuildContext context) => BlocProvider.of(context);

  GetExamQuestionsUseCase getExamQuestionsUseCase;

  ExamsModel exam;
  ExamResultEntity? examResult;
  PageController pageViewController = PageController();
  Timer? _timer;
  int remainingSeconds = 0;
  bool lastFewMinutes = false;

  void doEvent(ExamEvents event) {
    switch (event) {
      case GetExamQuestions():
        {
          _getExamQuestions();
          break;
        }
      case NextQuestion():
        {
          _nextQuestion();
          break;
        }
      case PreviousQuestion():
        {
          _previousQuestion();
          break;
        }
      case SelectAnswer():
        {
          _selectAnswer(
            questionIndex: event.questionIndex,
            answer: event.answer,
          );
          break;
        }
      case FinishExam():
        {
          _finishExam();
          break;
        }
    }
  }

  Future<void> _getExamQuestions() async {
    emit(
      state.copyWith(
        examStateParam: state.examState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
        ),
      ),
    );

    final result = await getExamQuestionsUseCase(examId: exam.id);

    switch (result) {
      case Success():
        {
          emit(
            state.copyWith(
              examStateParam: state.examState.copyWith(
                isLoadingParam: false,
                isSuccessParam: true,
                errorMessageParam: null,
                dataParam: result.data,
              ),
            ),
          );
          if (state.examState.data != null &&
              state.examState.data!.isNotEmpty) {
            _startTimer();
          }
        }

      case Failure():
        {
          emit(
            state.copyWith(
              examStateParam: state.examState.copyWith(
                isLoadingParam: false,
                errorMessageParam: result.errorMessage,
              ),
            ),
          );
        }
    }
  }

  void _startTimer() {
    remainingSeconds = exam.duration * 60;

    _timer?.cancel();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;

        if (remainingSeconds <= 15 * 60) {
          lastFewMinutes = true;
        }
        emit(state.copyWith());
      } else {
        timer.cancel();
      }
    });
  }

  String get formattedTime {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;

    return "${minutes.toString().padLeft(2, '0')}:"
        "${seconds.toString().padLeft(2, '0')}";
  }

  void _selectAnswer({required int questionIndex, required String answer}) {
    final List<QuestionsEntity> questions = List.of(state.examState.data!);

    questions[questionIndex] = questions[questionIndex].copyWith(
      userAnswerParam: answer,
    );

    emit(
      state.copyWith(
        examStateParam: state.examState.copyWith(dataParam: questions),
      ),
    );
  }

  void _nextQuestion() {
    if (state.currentPage < state.examState.data!.length - 1) {
      pageViewController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      emit(state.copyWith(currentPageParam: state.currentPage + 1));
    }
  }

  void _previousQuestion() {
    if (state.currentPage > 0) {
      pageViewController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      emit(state.copyWith(currentPageParam: state.currentPage - 1));
    }
  }

  void _finishExam() {
    examResult = _calculateExamResult();
  }

  ExamResultEntity _calculateExamResult() {
    final List<QuestionsEntity> questions = List.of(state.examState.data!);
    int correctAnswers = 0;
    int wrongAnswers = 0;

    for (var question in questions) {
      if (question.correct == question.userAnswer) {
        correctAnswers++;
      } else {
        wrongAnswers++;
      }
    }

    return ExamResultEntity(
      exam: exam,
      questions: questions,
      correctAnswers: correctAnswers,
      wrongAnswers: wrongAnswers,
      percentage: ((correctAnswers / questions.length) * 100),
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    pageViewController.dispose();
    return super.close();
  }
}
