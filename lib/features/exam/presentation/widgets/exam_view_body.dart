import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/core/values/app_strings.dart';

import '../../../../core/utils/app_colors.dart';
import 'question_page_view_item.dart';
import 'questions_progress.dart';

class ExamViewBody extends StatelessWidget {
  const ExamViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyResponsive.paddingSymmetric(
        horizontal: AppConstants.paddingHorizontal,
      ),
      child: Column(
        children: [
          QuestionsProgress(),
          SizedBox(height: MyResponsive.height(value: 28)),

          Expanded(
            child: PageView.builder(
              itemCount: 3,
              controller: PageController(),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.grey,
                );
              },
              onPageChanged: (value) {},
            ),
          ),

          SizedBox(height: MyResponsive.height(value: 24)),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: () {},
                  title: AppStrings.back,
                  backgroundColor: AppColors.baseWhite,
                  foregroundColor: AppColors.primaryColor,
                  radiusValue: 10,
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 16)),
              Expanded(
                child: CustomButton(
                  onPressed: () {},
                  title: AppStrings.next,
                  radiusValue: 10,
                ),
              ),
            ],
          ),
          SizedBox(height: MyResponsive.height(value: 196)),
        ],
      ),
    );
  }
}
