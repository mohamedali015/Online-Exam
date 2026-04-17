import 'package:flutter/material.dart';
import '../../../../config/route_manager/routes.dart';
import '../../../../core/values/app_strings.dart';
import '../widgets/forget_password_verify_otp_widgets/forget_password_verify_otp_view_body.dart';

class ForgetPasswordVerifyOtpView extends StatelessWidget {
  const ForgetPasswordVerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.loginRoute,
          (route) => false,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppStrings.password),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.loginRoute,
                (route) => false,
              );
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: ForgetPasswordVerifyOtpViewBody(),
      ),
    );
  }
}
