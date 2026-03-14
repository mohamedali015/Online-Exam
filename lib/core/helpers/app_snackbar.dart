import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

abstract class AppSnackbar {
  static void error(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
            message,
            style: AppTextStyles.medium16.copyWith(color: AppColors.baseWhite),
          ),
          backgroundColor: AppColors.error,
          duration: const Duration(seconds: 5),
      ),

    );
  }

  static void success(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            message,
          style: AppTextStyles.medium20.copyWith(fontWeight: FontWeight.bold, color: AppColors.baseWhite),
        ),
        backgroundColor: AppColors.success,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
