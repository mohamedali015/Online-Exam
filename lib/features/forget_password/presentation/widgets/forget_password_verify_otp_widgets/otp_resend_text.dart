import 'package:flutter/material.dart';

import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class OtpResendText extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onTap;
  final bool isLoading;

  const OtpResendText({
    super.key,
    required this.title,
    required this.actionText,
    required this.onTap,
    this.isLoading = false,
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
          child: isLoading
              ? SizedBox(
                  width: MyResponsive.width(value: 22),
                  height: MyResponsive.height(value: 22),
                  child: CircularProgressIndicator(),
                )
              : Text(
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
