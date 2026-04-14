import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/core/shared_widgets/custom_text_form_field.dart';
import 'package:online_exam/features/forget_password/presentation/manager/forget_password_cubit/forget_password_state.dart';

import '../../../../../config/route_manager/routes.dart';
import '../../../../../core/helpers/app_snackbar.dart';
import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/values/app_strings.dart';
import '../../manager/forget_password_cubit/forget_password_cubit.dart';
import '../../manager/forget_password_cubit/forget_password_events.dart';

class ForgetPasswordNewPasswordViewBody extends StatelessWidget {
  const ForgetPasswordNewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ForgetPasswordCubit.get(context);
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

          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listenWhen: (previous, current) {
              return previous.resetPasswordState != current.resetPasswordState;
            },
            buildWhen: (previous, current) {
              return previous.resetPasswordState !=
                      current.resetPasswordState ||
                  previous.isPasswordFormValid != current.isPasswordFormValid;
            },
            listener: (context, state) {
              if (state.resetPasswordState.isSuccess) {
                AppSnackbar.success(context, 'Password Changed Successfully');
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
              } else if (state.resetPasswordState.errorMessage != null) {
                AppSnackbar.error(
                  context,
                  state.resetPasswordState.errorMessage!,
                );
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
                      obsecure: state.passwordObsecure,
                      onChanged: (_) => cubit.validatePasswordForm(),
                      isLoading: state.resetPasswordState.isLoading,
                    ),
                    SizedBox(height: MyResponsive.height(value: 24)),
                    CustomTextFormField(
                      type: TextFieldType.password,
                      controller: cubit.confirmPasswordController,
                      passController: cubit.passwordController,
                      obsecure: state.confirmPasswordObsecure,
                      onChanged: (_) => cubit.validatePasswordForm(),
                      isLoading: state.resetPasswordState.isLoading,
                    ),
                    SizedBox(height: MyResponsive.height(value: 48)),

                    CustomButton(
                      title: AppStrings.continues,
                      onPressed: state.isPasswordFormValid
                          ? () => cubit.doEvent(ResetPasswordEvent())
                          : null,
                      isLoading: state.resetPasswordState.isLoading,
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
