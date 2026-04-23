import 'package:flutter/material.dart';

import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/values/app_strings.dart';
import '../../../exam/domain/entities/exam_result_entity.dart';
import '../../../exam/domain/entities/questions_entity.dart';

class ResultDetailsScreen extends StatelessWidget {
  const ResultDetailsScreen({super.key, required this.exam});

  final ExamResultEntity exam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.answers),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: ListView.separated(
        padding: MyResponsive.paddingAll(value: 16),
        itemCount: exam.questions.length,
        separatorBuilder: (_, _) =>
            SizedBox(height: MyResponsive.height(value: 16)),
        itemBuilder: (context, index) {
          return QuestionResultCard(question: exam.questions[index]);
        },
      ),
    );
  }
}

class QuestionResultCard extends StatelessWidget {
  const QuestionResultCard({super.key, required this.question});

  final QuestionsEntity question;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MyResponsive.paddingSymmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.baseWhite,
        borderRadius: BorderRadius.circular(MyResponsive.radius(value: 12)),
        boxShadow: const [
          BoxShadow(color: AppColors.selectedBlue, blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.question, style: AppTextStyles.medium18),

          SizedBox(height: MyResponsive.height(value: 16)),

          ...question.answers.map((answer) {
            final isCorrect = answer.key == question.correct;
            final isUser = answer.key == question.userAnswer;

            return Container(
              margin: MyResponsive.paddingOnly(bottom: 16),
              padding: MyResponsive.paddingSymmetric(
                horizontal: 22,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MyResponsive.radius(value: 10),
                ),
                color: _bgColor(isCorrect, isUser),
                border: Border.all(color: _borderColor(isCorrect, isUser)),
              ),
              child: Row(
                children: [
                  Icon(
                    isUser
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: _radioColor(isCorrect, isUser),
                  ),
                  SizedBox(width: MyResponsive.width(value: 18)),

                  Expanded(
                    child: Text(answer.answer, style: AppTextStyles.regular14),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Color _bgColor(bool isCorrect, bool isUser) {
    if (isCorrect) return AppColors.lightGreen;
    if (isUser && !isCorrect) return AppColors.lightRed;
    return AppColors.questionsLightBlue;
  }

  Color _borderColor(bool isCorrect, bool isUser) {
    if (isCorrect) return AppColors.success;
    if (isUser && !isCorrect) return AppColors.error;
    return Colors.transparent;
  }

  Color _radioColor(bool isCorrect, bool isUser) {
    if (isCorrect) return AppColors.success;
    if (isUser && !isCorrect) return AppColors.error;
    return AppColors.baseBlack;
  }
}
