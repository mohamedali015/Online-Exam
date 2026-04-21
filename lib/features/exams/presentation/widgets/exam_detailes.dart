import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';

class ExamDetailes extends StatelessWidget {
  const ExamDetailes({
    super.key,
    required this.examTitle,
    required this.examDuration,
    required this.examNumberOfQuestions,
  });

  final String examTitle;
  final int examDuration;
  final int examNumberOfQuestions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyResponsive.paddingSymmetric(horizontal: 24, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/png/exam.png',
                width: MyResponsive.width(value: 42),
                height: MyResponsive.height(value: 47),
              ),
              SizedBox(width: MyResponsive.width(value: 10)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(examTitle, style: AppTextStyles.semiBold20),
                    SizedBox(width: MyResponsive.width(value: 10)),
                    Text(
                      '$examDuration Minutes',
                      style: AppTextStyles.regular13.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: MyResponsive.height(value: 10)),
          Row(
            children: [
              Text('Exam Date', style: AppTextStyles.medium18),
              SizedBox(width: MyResponsive.width(value: 10)),
              Text(
                '|',
                style: AppTextStyles.medium18.copyWith(
                  color: AppColors.selectedBlue,
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 10)),

              Text(
                '$examNumberOfQuestions Questions',
                style: AppTextStyles.regular16.copyWith(
                  color: AppColors.baseGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
