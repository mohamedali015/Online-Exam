import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/core/shared_widgets/custom_text_form_field.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/core/values/app_strings.dart';

import '../../../../../config/route_manager/routes.dart';
import '../../../../../core/helpers/app_snackbar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/forget_password_enter_email_cubit/forget_password_enter_email_cubit.dart';
import '../../manager/forget_password_enter_email_cubit/forget_password_enter_email_state.dart';

class ForgetPasswordEnterEmailViewBody extends StatelessWidget {
  const ForgetPasswordEnterEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ForgetPasswordEnterEmailCubit.get(context);
    return Padding(
      padding: MyResponsive.paddingSymmetric(
        horizontal: AppConstants.paddingHorizontal,
      ),
      child:
          BlocConsumer<
            ForgetPasswordEnterEmailCubit,
            ForgetPasswordEnterEmailState
          >(
            listener: (context, state) {
              if (state is ForgetPasswordEnterEmailSuccess) {
                AppSnackbar.success(context, 'Otp Send Successfully');
                Navigator.pushNamed(context, Routes.forgetPasswordOtpViewRoute);
              } else if (state is ForgetPasswordEnterEmailFailure) {
                AppSnackbar.error(context, state.errorMessage);
              }
            },

            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MyResponsive.height(value: 40)),

                  Text(
                AppStrings.forgetPassword,
                style: AppTextStyles.medium18.copyWith(
                  color: AppColors.baseBlack,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MyResponsive.height(value: 16)),
              Text(
                AppStrings.enterYourEmailAssociatedToYourAccount,
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.baseBlack,
                ),
                textAlign: TextAlign.center,
              ),

                  SizedBox(height: MyResponsive.height(value: 32)),

                  Form(
                key: cubit.formKey,
                child: CustomTextFormField(
                  type: TextFieldType.email,
                  controller: cubit.emailController,
                  onChanged: (_) => cubit.validateForm(),
                  isLoading: state is ForgetPasswordEnterEmailLoading,
                ),
              ),

                  SizedBox(height: MyResponsive.height(value: 48)),

                  CustomButton(
                title: AppStrings.continues,
                onPressed: cubit.isFormValid ? cubit.submitEmail : null,
                isLoadings: state is ForgetPasswordEnterEmailLoading,

              ),
            ],
          );
        },
      ),
    );
  }
}
