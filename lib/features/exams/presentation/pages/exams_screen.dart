import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/values/app_strings.dart';
import '../../../home/domain/entities/get_all_subjects_entity.dart';

class ExamsScreen extends StatelessWidget {
  final SubjectEntity item;
  const ExamsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name ?? AppStrings.noNameFound),
      ),
      body: Center(
        child: Text(
          item.id ?? AppStrings.noIdFound,
          style: AppTextStyles.medium20.copyWith(
            color: AppColors.baseBlack,
          ),
        ),
      ),
    );
  }
}

