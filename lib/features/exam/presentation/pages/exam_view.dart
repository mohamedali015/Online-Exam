import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/features/exam/presentation/manager/exam_cubit.dart';
import 'package:online_exam/features/exam/presentation/manager/exam_state.dart';

import '../../../../core/values/app_strings.dart';
import '../../../exams/domain/entities/exam_model.dart';
import '../../domain/use_cases/get_exam_questions_use_case.dart';
import '../manager/exam_events.dart';
import '../widgets/exam_view_body.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context) {
    ExamsModel exam = ModalRoute.of(context)!.settings.arguments as ExamsModel;

    return BlocProvider(
      create: (context) => ExamCubit(
        getExamQuestionsUseCase: getIt<GetExamQuestionsUseCase>(),
        exam: exam,
      )..doEvent(GetExamQuestions()),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppStrings.exam),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),

          actions: [
            Padding(
              padding: MyResponsive.paddingOnly(end: 16),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.timerImagePath,
                    width: MyResponsive.width(value: 24),
                  ),
                  SizedBox(width: MyResponsive.width(value: 8)),
                  BlocBuilder<ExamCubit, ExamState>(
                    builder: (context, state) {
                      return Text(
                        ExamCubit.get(context).formattedTime,
                        style: AppTextStyles.regular20.copyWith(
                          color: ExamCubit.get(context).lastFewMinutes
                              ? AppColors.error
                              : AppColors.success,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        body: ExamViewBody(),
      ),
    );
  }
}
