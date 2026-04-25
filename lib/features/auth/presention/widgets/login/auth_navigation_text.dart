import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class AuthNavigationText extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onTap;

  const AuthNavigationText({
    super.key,
    required this.title,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$title ",
          style: AppTextStyles.regular16().copyWith(color: AppColors.baseBlack),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: AppTextStyles.regular16().copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
