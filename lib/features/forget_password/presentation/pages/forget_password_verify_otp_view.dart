import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/values/app_strings.dart';
import '../widgets/forget_password_verify_otp_widgets/forget_password_verify_otp_view_body.dart';

class ForgetPasswordVerifyOtpView extends StatelessWidget {
  const ForgetPasswordVerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            AppStrings.password,
            style: AppTextStyles.medium20.copyWith(color: AppColors.baseBlack),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: ForgetPasswordVerifyOtpViewBody(),
      ),
    );
  }
}
