import 'package:flutter/material.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/core/values/app_strings.dart';

class UpdateProfileButton extends StatelessWidget {
  const UpdateProfileButton({
    super.key,
    required this.canSubmit,
    required this.isLoading,
    required this.onPressed,
  });

  final bool canSubmit;
  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: canSubmit && !isLoading ? onPressed : null,
      isLoading: isLoading,
      title: AppStrings.update,
    );
  }
}
