import 'package:flutter/material.dart';

import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/shared_widgets/cached_network_image_wrapper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/values/app_strings.dart';
import '../../../exam/domain/entities/exam_result_entity.dart';

class ResultExamCard extends StatelessWidget {
  const ResultExamCard({super.key, required this.exam});

  final ExamResultEntity exam;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MyResponsive.paddingSymmetric(vertical: 8, horizontal: 2),
      padding: MyResponsive.paddingSymmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.baseWhite,
        borderRadius: BorderRadius.circular(MyResponsive.radius(value: 10)),
        boxShadow: const [
          BoxShadow(color: AppColors.selectedBlue, blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          /// Image
          exam.exam.icon.isNotEmpty
              ? CachedNetworkImageWrapper(
                  imagePath: exam.exam.icon,
                  width: MyResponsive.width(value: 60),
                  height: MyResponsive.height(value: 60),
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  AppAssets.examImagePath,
                  width: MyResponsive.width(value: 60),
                  height: MyResponsive.height(value: 60),
                  fit: BoxFit.fill,
                ),

          SizedBox(width: MyResponsive.width(value: 10)),

          /// Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Top Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// title + duration
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// title
                        Expanded(
                          child: Text(
                            exam.exam.title,
                            style: AppTextStyles.medium16,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        SizedBox(width: MyResponsive.width(value: 8)),

                        /// duration
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${exam.exam.duration}",
                              style: AppTextStyles.regular13,
                            ),
                            SizedBox(width: MyResponsive.width(value: 4)),
                            Text(
                              AppStrings.minutes,
                              style: AppTextStyles.regular13,
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: MyResponsive.height(value: 4)),

                    /// questions count
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${exam.questions.length}",
                          style: AppTextStyles.regular13.copyWith(
                            color: AppColors.baseGray,
                          ),
                        ),
                        SizedBox(width: MyResponsive.width(value: 4)),
                        Text(
                          AppStrings.question,
                          style: AppTextStyles.regular13.copyWith(
                            color: AppColors.baseGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: MyResponsive.height(value: 16)),

                /// Result Info
                Row(
                  children: [
                    Text(
                      "${exam.correctAnswers}",
                      style: AppTextStyles.semiBold12.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(width: MyResponsive.width(value: 4)),
                    Flexible(
                      child: Text(
                        AppStrings.correctedAnswersIn,
                        style: AppTextStyles.medium12.copyWith(
                          color: AppColors.primaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: MyResponsive.width(value: 4)),

                    /// spent minutes
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${exam.spentMinutes}",
                          style: AppTextStyles.semiBold12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: MyResponsive.width(value: 4)),
                        Text(
                          AppStrings.min,
                          style: AppTextStyles.medium12.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
