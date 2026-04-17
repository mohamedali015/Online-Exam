import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/forget_password/presentation/widgets/forget_password_verify_otp_widgets/custom_otp_field.dart';
import '../../../../../config/route_manager/routes.dart';
import '../../../../../core/helpers/app_snackbar.dart';
import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/values/app_strings.dart';
import '../../manager/forget_password_cubit/forget_password_cubit.dart';
import '../../manager/forget_password_cubit/forget_password_events.dart';
import '../../manager/forget_password_cubit/forget_password_state.dart';
import 'otp_resend_text.dart';

class ForgetPasswordVerifyOtpViewBody extends StatelessWidget {
  const ForgetPasswordVerifyOtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();

    return Padding(
      padding: MyResponsive.paddingSymmetric(
        horizontal: AppConstants.paddingHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MyResponsive.height(value: 40)),

          Text(
            AppStrings.emailVerification,
            style: AppTextStyles.medium18.copyWith(color: AppColors.baseBlack),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: MyResponsive.height(value: 16)),

          Text(
            AppStrings.enterYourCode,
            style: AppTextStyles.regular14.copyWith(color: AppColors.baseBlack),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: MyResponsive.height(value: 32)),

          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listenWhen: (previous, current) =>
                previous.verifyOtpState != current.verifyOtpState,
            buildWhen: (previous, current) =>
                previous.verifyOtpState != current.verifyOtpState,
            listener: (context, state) {
              if (state.verifyOtpState.isSuccess) {
                Navigator.pushNamed(
                  context,
                  Routes.forgetPasswordNewPassViewRoute,
                  arguments: cubit,
                );
              } else if (state.verifyOtpState.errorMessage != null &&
                  !state.verifyOtpState.isLoading) {
                AppSnackbar.error(context, state.verifyOtpState.errorMessage!);
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  CustomOtpField(
                    onCompleted: (otpCode) {
                      cubit.otpController.text = otpCode;
                      cubit.doEvent(VerifyOtpEvent());
                    },
                    isLoading: state.verifyOtpState.isLoading,
                    errorController: cubit.errorController,
                    controller: cubit.otpController,
                  ),

                  SizedBox(height: MyResponsive.height(value: 32)),

                  OtpResendText(
                    title: AppStrings.didNotReceiveCode,
                    actionText: AppStrings.resend,
                    onTap: () => cubit.doEvent(SendEmailEvent()),
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
