import 'package:flutter/material.dart';

import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/values/app_strings.dart';

class QuestionsProgress extends StatelessWidget {
  const QuestionsProgress({
    super.key,
    required this.totalQuestions,
    required this.currentQuestion,
  });

  final int totalQuestions;
  final int currentQuestion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${AppStrings.question} $currentQuestion ${AppStrings.of} $totalQuestions",
          style: AppTextStyles.medium14.copyWith(color: AppColors.baseGray),
        ),

        SizedBox(height: MyResponsive.height(value: 4)),

        ClipRRect(
          borderRadius: BorderRadius.circular(MyResponsive.radius(value: 100)),
          child: LinearProgressIndicator(
            value: currentQuestion / totalQuestions,
            minHeight: MyResponsive.height(value: 4),
            backgroundColor: AppColors.questionsBarGray,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
