import 'package:flutter/material.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/core/values/app_strings.dart';

import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class TimeOutDialog extends StatelessWidget {
  const TimeOutDialog({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MyResponsive.radius(value: 10)),
      ),
      child: Padding(
        padding: MyResponsive.paddingSymmetric(horizontal: 48, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.timeOutImagePath,
                  width: MyResponsive.width(value: 28),
                ),
                SizedBox(width: MyResponsive.width(value: 6)),
                Text(
                  AppStrings.timeOut,
                  style: AppTextStyles.regular24.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
            SizedBox(height: MyResponsive.height(value: 28)),
            CustomButton(title: AppStrings.viewScore, onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
