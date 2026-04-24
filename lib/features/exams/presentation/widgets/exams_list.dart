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
    return Padding(
      padding: MyResponsive.paddingSymmetric(vertical: 8, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MyResponsive.height(value: 12)),

          if (exams.isNotEmpty)
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return ExamCard(exam: exam);
              },
            ),
        ],
      ),
    );
  }
}
