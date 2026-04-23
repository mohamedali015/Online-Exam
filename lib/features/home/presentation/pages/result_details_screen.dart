import 'package:flutter/material.dart';

import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/values/app_strings.dart';
import '../../../exam/domain/entities/exam_result_entity.dart';
import '../../../results/presentation/widgets/question_esult_card.dart';

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
