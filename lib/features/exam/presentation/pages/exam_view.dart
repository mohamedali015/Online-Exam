import 'package:flutter/material.dart';
import 'package:online_exam/features/exams/domain/entities/exam_entity.dart';

class ExamView extends StatelessWidget {
  final ExamEntity exam;

  const ExamView({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.title)),
      body: Column(
        children: [
          Text("Duration: ${exam.duration}"),
          Text("Questions: ${exam.numberOfQuestions}"),
        ],
      ),
    );
  }
}
