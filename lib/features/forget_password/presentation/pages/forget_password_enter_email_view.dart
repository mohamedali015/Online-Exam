import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helpers/app_snackbar.dart';
import 'package:online_exam/features/forget_password/presentation/widgets/forget_password_enter_email_widgets/forget_password_enter_email_view_body.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/values/app_strings.dart';
import '../manager/forget_password_enter_email_cubit/forget_password_enter_email_cubit.dart';
import '../manager/forget_password_enter_email_cubit/forget_password_enter_email_state.dart';

class ForgetPasswordEnterEmailView extends StatelessWidget {
  const ForgetPasswordEnterEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body:
          BlocConsumer<
            ForgetPasswordEnterEmailCubit,
            ForgetPasswordEnterEmailState
          >(
            listener: (context, state) {
              if (state is ForgetPasswordEnterEmailSuccess) {
                AppSnackbar.success(context, 'Otp Send Successfully');
              } else if (state is ForgetPasswordEnterEmailFailure) {
                AppSnackbar.error(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return ForgetPasswordEnterEmailViewBody();
            },
          ),
    );
  }
}
