import 'package:flutter/material.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/exams/domain/entities/exam_entity.dart';
import 'package:online_exam/features/exams/presentation/widgets/exam_details.dart';

class ExamDetailsScreen extends StatelessWidget {
  final ExamEntity exam;

  const ExamDetailsScreen({super.key, required this.exam});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExamDetails(
            examTitle: exam.title,
            examDuration: exam.duration,
            examNumberOfQuestions: exam.numberOfQuestions,
          ),
          Divider(color: AppColors.selectedBlue),
          Padding(
            padding: MyResponsive.paddingSymmetric(
              horizontal: 24,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.instructions, style: AppTextStyles.medium18),
                SizedBox(height: MyResponsive.height(value: 10)),
                Padding(
                  padding: MyResponsive.paddingSymmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return _instructionItem(AppStrings.examInstruction);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MyResponsive.height(value: 20)),
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.examViewRoute,
                      arguments: exam,
                    );
                  },
                  title: AppStrings.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _instructionItem(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: AppTextStyles.medium14.copyWith(color: AppColors.baseGray),
        ),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.medium14.copyWith(color: AppColors.baseGray),
          ),
        ),
      ],
    ),
  );
}
