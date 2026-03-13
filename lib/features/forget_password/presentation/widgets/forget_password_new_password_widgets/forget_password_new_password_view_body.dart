import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/core/shared_widgets/custom_text_form_field.dart';

import '../../../../../config/route_manager/routes.dart';
import '../../../../../core/helpers/app_snackbar.dart';
import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/values/app_strings.dart';
import '../../manager/forget_password_new_password_cubit/forget_password_new_password_cubit.dart';
import '../../manager/forget_password_new_password_cubit/forget_password_new_password_state.dart';

class ForgetPasswordNewPasswordViewBody extends StatelessWidget {
  const ForgetPasswordNewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ForgetPasswordNewPasswordCubit.get(context);
    return Padding(
      padding: MyResponsive.paddingSymmetric(
        horizontal: AppConstants.paddingHorizontal,
      ),
      child: Column(
        children: [
          SizedBox(height: MyResponsive.height(value: 40)),

          Text(
            AppStrings.resetPassword,
            style: AppTextStyles.medium18.copyWith(color: AppColors.baseBlack),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MyResponsive.height(value: 16)),
          Text(
            AppStrings.passwordMustNotBeEmpty,
            style: AppTextStyles.regular14.copyWith(color: AppColors.baseBlack),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: MyResponsive.height(value: 32)),

          BlocConsumer<
            ForgetPasswordNewPasswordCubit,
            ForgetPasswordNewPasswordState
          >(
            listener: (context, state) {
              if (state is ForgetPasswordNewPasswordSuccess) {
                AppSnackbar.success(context, 'Password Changed Successfully');
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
              } else if (state is ForgetPasswordNewPasswordFailure) {
                AppSnackbar.error(context, state.errorMessage);
              }
            },

            builder: (context, state) {
              return Form(
                key: cubit.passwordFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      type: TextFieldType.password,
                      controller: cubit.passwordController,
                      obsecure: cubit.obsecure,
                      onChanged: (_) => cubit.validateForm(),
                      isLoading: state is ForgetPasswordNewPasswordLoading,
                    ),
                    SizedBox(height: MyResponsive.height(value: 24)),
                    CustomTextFormField(
                      type: TextFieldType.password,
                      controller: cubit.confirmPasswordController,
                      passController: cubit.passwordController,
                      obsecure: cubit.confirmObsecure,
                      onChanged: (_) => cubit.validateForm(),
                      isLoading: state is ForgetPasswordNewPasswordLoading,
                    ),
                    SizedBox(height: MyResponsive.height(value: 48)),

                    CustomButton(
                      title: AppStrings.continues,
                      onPressed: cubit.isFormValid
                          ? cubit.submitNewPassword
                          : null,
                      isLoadings: state is ForgetPasswordNewPasswordLoading,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
