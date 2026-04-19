import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/features/exams/domain/entities/exam_entity.dart';
import 'package:online_exam/features/exams/presentation/widgets/exam_card.dart';

class ExamsList extends StatelessWidget {
  final String? title;
  final List<ExamEntity> exams;

  const ExamsList({super.key, this.title, this.exams = const []});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: MyResponsive.paddingSymmetric(vertical: 8, horizontal: 24),
      itemCount: exams.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              title ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        }

        final exam = exams[index - 1];
        return ExamCard(exam: exam);
      },
    );
  }
}
