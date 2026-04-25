import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/core/values/app_strings.dart';

import '../../../../core/shared_widgets/cached_network_image_wrapper.dart';

class ExamDetails extends StatelessWidget {
  const ExamDetails({
    super.key,
    required this.examTitle,
    required this.examDuration,
    required this.examNumberOfQuestions,
    required this.examIcon,
  });

  final String examTitle;
  final int examDuration;
  final int examNumberOfQuestions;
  final String examIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyResponsive.paddingSymmetric(horizontal: 24, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              examIcon.isNotEmpty
                  ? CachedNetworkImageWrapper(
                      imagePath: examIcon,
                      width: MyResponsive.width(value: 48),
                      height: MyResponsive.height(value: 48),
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      AppAssets.examImagePath,
                      width: MyResponsive.width(value: 48),
                      height: MyResponsive.height(value: 48),
                      fit: BoxFit.fill,
                    ),
              SizedBox(width: MyResponsive.width(value: 10)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(examTitle, style: AppTextStyles.semiBold20),
                    SizedBox(width: MyResponsive.width(value: 10)),
                    Text(
                      '$examDuration ${AppStrings.minutes}',
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
              Text('${AppStrings.examDate}:', style: AppTextStyles.medium18),
              SizedBox(width: MyResponsive.width(value: 10)),
              Text(
                '|',
                style: AppTextStyles.medium18.copyWith(
                  color: AppColors.selectedBlue,
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 10)),

              Text(
                '$examNumberOfQuestions ${AppStrings.questions}',
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
