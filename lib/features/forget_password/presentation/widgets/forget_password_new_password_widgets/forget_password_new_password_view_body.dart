import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/features/forget_password/presentation/manager/forget_password_cubit/forget_password_state.dart';

import '../../../../../config/route_manager/routes.dart';
import '../../../../../core/helpers/app_snackbar.dart';
import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/helpers/validator.dart';
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
    final cubit = context.read<ForgetPasswordCubit>();

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
            listenWhen: (previous, current) =>
                previous.resetPasswordState != current.resetPasswordState,
            buildWhen: (previous, current) =>
                previous.resetPasswordState != current.resetPasswordState ||
                previous.isPasswordFormValid != current.isPasswordFormValid,
            listener: (context, state) {
              if (state.resetPasswordState.isSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.loginRoute,
                  (route) => false,
                );
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
                    TextFormField(
                      controller: cubit.passwordController,
                      obscureText: state.passwordObsecure,
                      onChanged: (_) => cubit.validatePasswordForm(),
                      enabled: !state.resetPasswordState.isLoading,
                      validator: Validator.password,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: AppStrings.password,
                        hintText: AppStrings.enterYouPassword,
                      ),
                    ),

                    SizedBox(height: MyResponsive.height(value: 24)),

                    TextFormField(
                      controller: cubit.confirmPasswordController,
                      obscureText: state.confirmPasswordObsecure,
                      onChanged: (_) => cubit.validatePasswordForm(),
                      enabled: !state.resetPasswordState.isLoading,
                      validator: (value) => Validator.confirmPassword(
                        value,
                        cubit.passwordController.text,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: AppStrings.confirmPassword,
                        hintText: AppStrings.enterYouPassword,
                      ),
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
