import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/values/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class RememberMeAndForgetWidget extends StatefulWidget {
  const RememberMeAndForgetWidget({
    super.key,
    required this.onChanged,
  });

  final void Function(bool?)? onChanged;

  @override
  State<RememberMeAndForgetWidget> createState() =>
      _RememberMeAndForgetWidgetState();
}

class _RememberMeAndForgetWidgetState
    extends State<RememberMeAndForgetWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        /// Checkbox
        Checkbox(
          value: isSelected,
          onChanged: (selected) async {
            setState(() {
              isSelected = selected!;
            });

            /// send value to parent
            widget.onChanged?.call(selected);
          },
        ),

        Text(
          AppStrings.rememberMe,
          style: AppTextStyles.regular13.copyWith(
            color: AppColors.baseBlack,
          ),
        ),

        const Spacer(),

        TextButton(
          onPressed: () {},
          child: Text(
            "${AppStrings.forgetPassword}?",
            style: AppTextStyles.regular12.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.baseBlack,
            ),
          ),
        )
      ],
    );
  }
}