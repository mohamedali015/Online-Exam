import 'package:flutter/material.dart';

import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/utils/app_colors.dart';

class ExamScorePercentage extends StatelessWidget {
  const ExamScorePercentage({super.key, required this.percentage});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MyResponsive.width(value: 120),
          height: MyResponsive.width(value: 120),
          child: CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: MyResponsive.width(value: 6),
            valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
            backgroundColor: AppColors.error,
            strokeCap: StrokeCap.round,
          ),
        ),
        Text(
          "${percentage.toInt()} %",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
