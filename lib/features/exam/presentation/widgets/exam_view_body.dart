import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/core/shared_widgets/custom_error_widget.dart';
import 'package:online_exam/core/shared_widgets/custom_loading_indicator.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/exam/presentation/manager/exam_cubit.dart';
import 'package:online_exam/features/exam/presentation/manager/exam_state.dart';
import 'package:online_exam/features/exam/presentation/widgets/finish_exam_dialog.dart';

import '../../../../core/utils/app_colors.dart';
import '../manager/exam_events.dart';
import 'question_page_view_item.dart';
import 'questions_progress.dart';
import 'time_out_dialog.dart';

class ExamViewBody extends StatelessWidget {
  const ExamViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ExamCubit>();
    return Padding(
      padding: MyResponsive.paddingSymmetric(
        horizontal: AppConstants.paddingHorizontal,
      ),
      child: BlocConsumer<ExamCubit, ExamState>(
        listener: (context, state) {
          if (cubit.remainingSeconds == 0 &&
              state.examState.data != null &&
              state.examState.data!.isNotEmpty) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => PopScope(
                canPop: false,
                child: TimeOutDialog(
                  onPressed: () {
                    cubit.doEvent(FinishExam());
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.examScoreViewRoute,
                      arguments: cubit.examResult,
                    );
                  },
                ),
              ),
            );
          }
        },

        buildWhen: (prev, curr) {
          return prev.examState != curr.examState ||
              prev.currentPage != curr.currentPage;
        },

        builder: (context, state) {
          if (state.examState.isLoading) {
            return CustomLoadingIndicator();
          } else if (state.examState.errorMessage != null &&
              state.examState.errorMessage!.isNotEmpty) {
            return CustomErrorWidget(
              errorMessage: state.examState.errorMessage!,
              haveTryAgain: true,
              onPressed: () {
                cubit.doEvent(GetExamQuestions());
              },
            );
          } else if (state.examState.data != null &&
              state.examState.data!.isNotEmpty &&
              state.examState.isLoading == false) {
            return Column(
              children: [
                QuestionsProgress(
                  currentQuestion: state.currentPage + 1,
                  totalQuestions: state.examState.data!.length,
                ),
                SizedBox(height: MyResponsive.height(value: 28)),
                Expanded(
                  child: PageView.builder(
                    itemCount: state.examState.data!.length,
                    controller: cubit.pageViewController,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var question = state.examState.data![index];
                      return QuestionPageViewItem(
                        question: question,
                        selectedAnswer: question.userAnswer,
                        onAnswerSelected: (answer) {
                          cubit.doEvent(
                            SelectAnswer(questionIndex: index, answer: answer),
                          );
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: MyResponsive.height(value: 20)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Visibility(
                        visible: state.currentPage > 0,
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        child: CustomButton(
                          onPressed: () {
                            cubit.doEvent(PreviousQuestion());
                          },
                          title: AppStrings.back,
                          backgroundColor: AppColors.baseWhite,
                          foregroundColor: AppColors.primaryColor,
                          radiusValue: 10,
                        ),
                      ),
                    ),
                    SizedBox(width: MyResponsive.width(value: 16)),
                    Expanded(
                      child: CustomButton(
                        onPressed:
                            state
                                .examState
                                .data![state.currentPage]
                                .userAnswer
                                .isEmpty
                            ? null
                            : () {
                                if (state.currentPage ==
                                    state.examState.data!.length - 1) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return FinishExamDialog(
                                        onFinish: () {
                                          cubit.doEvent(FinishExam());
                                          Navigator.pop(context);
                                          Navigator.pushReplacementNamed(
                                            context,
                                            Routes.examScoreViewRoute,
                                            arguments: cubit.examResult,
                                          );
                                        },
                                        onCancel: () {
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                  );
                                } else {
                                  cubit.doEvent(NextQuestion());
                                }
                              },
                        title:
                            state.currentPage ==
                                state.examState.data!.length - 1
                            ? AppStrings.finish
                            : AppStrings.next,
                        radiusValue: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MyResponsive.height(value: 180)),
              ],
            );
          } else if (state.examState.data != null &&
              state.examState.data!.isEmpty &&
              state.examState.isLoading == false) {
            return CustomErrorWidget(
              errorMessage: AppStrings.noQuestions,
              haveTryAgain: true,
              onPressed: () {
                cubit.doEvent(GetExamQuestions());
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
