import 'package:flutter/material.dart';

import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/values/app_strings.dart';

class FinishExamDialog extends StatelessWidget {
  const FinishExamDialog({
    super.key,
    required this.onFinish,
    required this.onCancel,
  });

  final VoidCallback onFinish;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MyResponsive.radius(value: 10)),
      ),
      child: Padding(
        padding: MyResponsive.paddingSymmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppStrings.warning, style: AppTextStyles.regular24()),
            SizedBox(height: MyResponsive.height(value: 36)),
            Text(
              AppStrings.warningSubtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.medium16().copyWith(
                color: AppColors.baseBlack.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: MyResponsive.height(value: 36)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomButton(
                    title: AppStrings.cancel,
                    backgroundColor: AppColors.baseWhite,
                    foregroundColor: AppColors.primaryColor,
                    onPressed: onCancel,
                    radiusValue: 10,
                  ),
                ),
                SizedBox(width: MyResponsive.width(value: 16)),
                Expanded(
                  child: CustomButton(
                    title: AppStrings.finish,
                    onPressed: onFinish,
                    radiusValue: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
