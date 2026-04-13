import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/helpers/validator.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';

import '../../../../../config/route_manager/routes.dart';
import '../../../../../core/helpers/app_snackbar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/forget_password_cubit/forget_password_events.dart';
import '../../manager/forget_password_cubit/forget_password_state.dart';

class ForgetPasswordEnterEmailViewBody extends StatelessWidget {
  const ForgetPasswordEnterEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyResponsive.paddingSymmetric(
        horizontal: AppConstants.paddingHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MyResponsive.height(value: 40)),

          Text(
            AppStrings.forgetPassword,
            style: AppTextStyles.medium18.copyWith(color: AppColors.baseBlack),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: MyResponsive.height(value: 16)),

          Text(
            AppStrings.enterYourEmailAssociatedToYourAccount,
            style: AppTextStyles.regular14.copyWith(color: AppColors.baseBlack),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: MyResponsive.height(value: 32)),

          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state.sendEmailState.isSuccess) {
                Navigator.pushNamed(
                  context,
                  Routes.forgetPasswordOtpViewRoute,
                  arguments: context.read<ForgetPasswordCubit>(),
                );
              } else if (state.sendEmailState.errorMessage != null &&
                  !state.sendEmailState.isLoading) {
                AppSnackbar.error(context, state.sendEmailState.errorMessage!);
              }
            },
            listenWhen: (previous, current) =>
                previous.sendEmailState != current.sendEmailState,
            buildWhen: (previous, current) =>
                previous.sendEmailState != current.sendEmailState ||
                previous.isEmailValid != current.isEmailValid,

            builder: (context, state) {
              var cubit = context.read<ForgetPasswordCubit>();

              return Column(
                children: [
                  Form(
                    key: cubit.emailFormKey,
                    child: TextFormField(
                      controller: cubit.emailController,
                      validator: Validator.email,
                      onChanged: (_) => cubit.validateEmailForm(),
                      enabled: !state.sendEmailState.isLoading,
                      decoration: InputDecoration(
                        labelText: AppStrings.email,
                        hintText: AppStrings.enterYouEmail,
                      ),
                    ),
                  ),

                  SizedBox(height: MyResponsive.height(value: 48)),

                  CustomButton(
                    title: AppStrings.continues,
                    onPressed: state.isEmailValid
                        ? () => cubit.doEvent(SendEmailEvent())
                        : null,
                    isLoadings: state.sendEmailState.isLoading,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
