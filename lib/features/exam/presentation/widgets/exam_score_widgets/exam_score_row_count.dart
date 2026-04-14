import 'package:flutter/material.dart';

import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ExamScoreRowCount extends StatelessWidget {
  const ExamScoreRowCount({
    super.key,
    required this.title,
    required this.count,
    this.isCorrect = false,
  });

  final String title;
  final int count;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.medium16.copyWith(
              color: isCorrect ? AppColors.primaryColor : AppColors.error,
            ),
          ),
        ),
        Container(
          padding: MyResponsive.paddingSymmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(
              color: isCorrect ? AppColors.primaryColor : AppColors.error,
              width: MyResponsive.width(value: 2),
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$count',
              style: AppTextStyles.medium14.copyWith(
                color: isCorrect ? AppColors.primaryColor : AppColors.error,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
