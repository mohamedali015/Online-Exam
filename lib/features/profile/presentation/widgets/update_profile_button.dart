import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/shared_widgets/custom_loading_indicator.dart';
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
    return ElevatedButton(
      onPressed: canSubmit && !isLoading ? onPressed : null,
      child: isLoading
          ? SizedBox(
              height: MyResponsive.height(value: 22),
              width: MyResponsive.width(value: 22),
              child: CustomLoadingIndicator(),
            )
          : const Text(AppStrings.update),
    );
  }
}
