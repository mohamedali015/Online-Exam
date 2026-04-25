import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/features/exam/domain/entities/exam_result_entity.dart';

import '../../../../config/route_manager/routes.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/values/app_strings.dart';
import '../widgets/exam_score_widgets/exam_score_percentage.dart';
import '../widgets/exam_score_widgets/exam_score_row_count.dart';

class ExamScoreView extends StatelessWidget {
  const ExamScoreView({super.key, required this.examResult});

  final ExamResultEntity examResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppStrings.examScore),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: MyResponsive.paddingSymmetric(
          horizontal: AppConstants.paddingHorizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MyResponsive.height(value: 20)),
            Text(AppStrings.yourScore, style: AppTextStyles.medium18()),
            SizedBox(height: MyResponsive.height(value: 24)),
            Row(
              children: [
                ExamScorePercentage(percentage: examResult.percentage),
                SizedBox(width: MyResponsive.width(value: 22)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExamScoreRowCount(
                        title: AppStrings.correct,
                        count: examResult.correctAnswers,
                        isCorrect: true,
                      ),
                      SizedBox(height: MyResponsive.height(value: 8)),
                      ExamScoreRowCount(
                        title: AppStrings.incorrect,
                        count: examResult.wrongAnswers,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: MyResponsive.width(value: 18)),
              ],
            ),
            SizedBox(height: MyResponsive.height(value: 80)),
            CustomButton(
              title: AppStrings.showResult,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.homeRoute,
                  arguments: 1,
                  (route) => false,
                );
              },
            ),
            SizedBox(height: MyResponsive.height(value: 24)),
            CustomButton(
              title: AppStrings.startAgain,
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.examViewRoute,
                  arguments: examResult.exam,
                );
              },
              backgroundColor: AppColors.baseWhite,
              foregroundColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
