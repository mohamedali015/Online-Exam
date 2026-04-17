import 'package:flutter/material.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.exam});

  final ExamsModel exam;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.examDetailsRoute,
          arguments: {
            'title': exam.title,
            'duration': exam.duration,
            'numberOfQuestions': exam.numberOfQuestions,
          },
        );
      },
      child: Container(
        height: MyResponsive.height(value: 90),
        padding: MyResponsive.paddingAll(value: 10),
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          borderRadius: BorderRadius.circular(MyResponsive.radius(value: 10)),
          boxShadow: [
            BoxShadow(
              color: AppColors.questionsBarGray,
              blurRadius: MyResponsive.radius(value: 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/png/exam.png',
              width: MyResponsive.width(value: 60),
              height: MyResponsive.height(value: 70),
            ),
            SizedBox(width: MyResponsive.width(value: 10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            exam.title,
                            // exam.title,
                            style: AppTextStyles.medium16,
                          ),
                          Text(
                            '${exam.duration} Minutes',
                            style: AppTextStyles.regular13.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${exam.numberOfQuestions} Questions',
                        style: AppTextStyles.regular13.copyWith(
                          color: AppColors.baseGray,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: MyResponsive.height(value: 20)),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: AppStrings.from,
                          style: AppTextStyles.regular13.copyWith(
                            color: AppColors.baseBlack,
                          ),
                          children: [
                            TextSpan(
                              text: AppStrings.startTime,
                              style: AppTextStyles.medium14.copyWith(
                                color: AppColors.baseBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: MyResponsive.width(value: 10)),
                      RichText(
                        text: TextSpan(
                          text: AppStrings.to,
                          style: AppTextStyles.regular13.copyWith(
                            color: AppColors.baseBlack,
                          ),
                          children: [
                            TextSpan(
                              text: AppStrings.endTime,
                              style: AppTextStyles.medium14.copyWith(
                                color: AppColors.baseBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
