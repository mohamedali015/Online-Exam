import 'package:flutter/material.dart';

import '../../../../core/values/app_strings.dart';

class ExamView extends StatelessWidget {
  final String examTitle;
  final int examDuration;
  final int examNumberOfQuestions;
  const ExamView({
    super.key,
    required this.examTitle,
    required this.examDuration,
    required this.examNumberOfQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppStrings.exam),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Column(
        children: [
          Text(examTitle),
          Text('$examDuration Minutes'),
          Text('$examNumberOfQuestions Questions'),
        ],
      ),
    );
  }
}
