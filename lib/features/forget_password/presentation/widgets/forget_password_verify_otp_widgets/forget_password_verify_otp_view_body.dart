import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/forget_password/presentation/widgets/forget_password_verify_otp_widgets/auth_navigation_text.dart';
import 'package:online_exam/features/forget_password/presentation/widgets/forget_password_verify_otp_widgets/custom_otp_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../config/route_manager/routes.dart';
import '../../../../../core/helpers/app_snackbar.dart';
import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/values/app_strings.dart';
import '../../manager/forget_password_otp_cubit/forget_password_otp_cubit.dart';
import '../../manager/forget_password_otp_cubit/forget_password_otp_state.dart';

class ForgetPasswordVerifyOtpViewBody extends StatelessWidget {
  const ForgetPasswordVerifyOtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ForgetPasswordOtpCubit.get(context);
    return Padding(
      padding: MyResponsive.paddingSymmetric(
        horizontal: AppConstants.paddingHorizontal,
      ),
      child: BlocConsumer<ForgetPasswordOtpCubit, ForgetPasswordOtpState>(
        listener: (context, state) {
          if (state is ForgetPasswordOtpVerified) {
            AppSnackbar.success(context, 'Otp Verified Successfully');
            Navigator.pushNamed(context, Routes.forgetPasswordNewPassViewRoute);
          } else if (state is ForgetPasswordOtpResend) {
            AppSnackbar.error(context, 'Otp Resend Successfully');
          } else if (state is ForgetPasswordOtpFailure) {
            AppSnackbar.error(context, state.errorMessage);
          }
        },

        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MyResponsive.height(value: 40)),

              Text(
                AppStrings.emailVerification,
                style: AppTextStyles.medium18.copyWith(
                  color: AppColors.baseBlack,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MyResponsive.height(value: 16)),
              Text(
                AppStrings.enterYourCode,
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.baseBlack,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: MyResponsive.height(value: 32)),

              CustomOtpField(
                onCompleted: (otpCode) {
                  cubit.verifyOtp(otpCode);
                },
                isLoading: state is ForgetPasswordOtpLoading,
                errorController: cubit.errorController,
                controller: cubit.otpController,
              ),

              SizedBox(height: MyResponsive.height(value: 32)),

              AuthNavigationText(
                title: AppStrings.didNotReceiveCode,
                actionText: AppStrings.resend,
                onTap: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
