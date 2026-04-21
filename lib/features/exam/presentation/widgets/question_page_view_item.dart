import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';

import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../domain/entities/questions_entity.dart';

class QuestionPageViewItem extends StatelessWidget {
  final QuestionsEntity question;
  final String? selectedAnswer;
  final Function(String) onAnswerSelected;

  const QuestionPageViewItem({
    super.key,
    required this.question,
    required this.selectedAnswer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.question, style: AppTextStyles.medium18),

          SizedBox(height: MyResponsive.height(value: 24)),

          RadioGroup<String>(
            groupValue: selectedAnswer,
            onChanged: (value) {
              onAnswerSelected(value!);
            },
            child: Column(
              children: question.answers.map((answer) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: MyResponsive.paddingSymmetric(
                    horizontal: 4,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      MyResponsive.radius(value: 10),
                    ),
                    color: answer.key == selectedAnswer
                        ? AppColors.selectedBlue
                        : AppColors.questionsLightBlue,
                  ),
                  child: RadioListTile<String>(
                    value: answer.key,
                    title: Text(answer.answer, style: AppTextStyles.regular14),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
