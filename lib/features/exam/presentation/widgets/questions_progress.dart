import 'package:flutter/material.dart';

import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/values/app_strings.dart';

class QuestionsProgress extends StatelessWidget {
  const QuestionsProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${AppStrings.question} 4 ${AppStrings.of} 20",
          style: AppTextStyles.medium14.copyWith(color: AppColors.baseGray),
        ),

        SizedBox(height: MyResponsive.height(value: 4)),

        ClipRRect(
          borderRadius: BorderRadius.circular(MyResponsive.radius(value: 100)),
          child: LinearProgressIndicator(
            value: 4 / 20,
            minHeight: MyResponsive.height(value: 4),
            backgroundColor: AppColors.questionsBarGray,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
