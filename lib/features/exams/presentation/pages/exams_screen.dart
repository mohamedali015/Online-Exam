import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class ExamsScreen extends StatelessWidget {
  final String subjectId;
  const ExamsScreen({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          subjectId,
          style: AppTextStyles.medium20.copyWith(
            color: AppColors.baseBlack,
          ),
        ),
      ),
    );
  }
}

