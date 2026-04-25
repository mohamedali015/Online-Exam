import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/features/exam/presentation/manager/exam_cubit.dart';
import 'package:online_exam/features/exam/presentation/manager/exam_state.dart';
import 'package:online_exam/features/exam/presentation/widgets/back_exam_dialog.dart';
import 'package:online_exam/features/exams/domain/entities/exam_entity.dart';

import '../../../../core/values/app_strings.dart';
import '../manager/exam_events.dart';
import '../widgets/exam_view_body.dart';

class ExamView extends StatefulWidget {
  const ExamView({super.key, required this.examsModel});

  final ExamEntity examsModel;

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  @override
  void initState() {
    super.initState();
    context.read<ExamCubit>().exam = widget.examsModel;
    context.read<ExamCubit>().doEvent(GetExamQuestions());
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        showDialog(
          context: context,
          builder: (_) => BackExamDialog(
            onBack: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppStrings.exam),
          leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => BackExamDialog(
                  onBack: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              );
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
                        context.read<ExamCubit>().formattedTime,
                        style: AppTextStyles.regular20.copyWith(
                          color: context.read<ExamCubit>().lastFewMinutes
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
