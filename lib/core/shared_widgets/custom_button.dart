import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.radiusValue = 100,
    this.isLoadings = false,
  });

  final String title;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final double? radiusValue;
  final bool isLoadings;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoadings ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusValue!),
        ),
      ),
      child: isLoadings
          ? SizedBox(
              width: MyResponsive.width(value: 22),
              height: MyResponsive.height(value: 22),
              child: CircularProgressIndicator(),
            )
          : Text(
              title,
              style: AppTextStyles.medium16.copyWith(color: foregroundColor),
            ),
    );
  }
}
