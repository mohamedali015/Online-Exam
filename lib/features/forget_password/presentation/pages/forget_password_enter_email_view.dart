import 'package:flutter/material.dart';
import 'package:online_exam/features/forget_password/presentation/widgets/forget_password_enter_email_widgets/forget_password_enter_email_view_body.dart';

import '../../../../core/values/app_strings.dart';

class ForgetPasswordEnterEmailView extends StatelessWidget {
  const ForgetPasswordEnterEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppStrings.password),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: ForgetPasswordEnterEmailViewBody(),
    );
  }
}
