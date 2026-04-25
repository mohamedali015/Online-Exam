import 'package:flutter/material.dart';
import 'package:online_exam/config/route_manager/routes.dart';

import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/values/app_strings.dart';
import '../../../exam/domain/entities/exam_result_entity.dart';
import '../widgets/question_result_card.dart';

class ResultDetailsScreen extends StatelessWidget {
  const ResultDetailsScreen({super.key, required this.exam});

  final ExamResultEntity exam;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.homeRoute,
          arguments: 1,
          (route) => false,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.answers),
          leading: IconButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeRoute,
              arguments: 1,
              (route) => false,
            ),
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
      ),
    );
  }
}
