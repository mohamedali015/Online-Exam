import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../config/error_handling/result.dart';
import '../../../domain/use_cases/enter_email_forget_password_use_case.dart';
import '../../../domain/use_cases/get_new_password_forget_password_use_case.dart';
import '../../../domain/use_cases/verify_otp_forget_password_use_case.dart';
import 'forget_password_events.dart';
import 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(
    this._enterEmailUseCase,
    this._verifyOtpUseCase,
    this._resetPasswordUseCase,
  ) : super(ForgetPasswordState());

  /// useCases
  final EnterEmailUseCase _enterEmailUseCase;
  final VerifyOtpForgetPasswordUseCase _verifyOtpUseCase;
  final GetNewPasswordForgetPasswordUseCase _resetPasswordUseCase;

  /// Controllers
  final emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>.broadcast();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  /// Form Keys
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  void doEvent(ForgetPasswordEvents event) {
    switch (event) {
      case SendEmailEvent():
        {
          _sendEmail();
          break;
        }

      case VerifyOtpEvent():
        {
          _verifyOtp();
          break;
        }

      case ResetPasswordEvent():
        {
          _resetPassword();
          break;
        }
    }
  }

  Future<void> _sendEmail() async {
    if (!emailFormKey.currentState!.validate()) {
      return;
    }
    emit(
      state.copyWith(
        sendEmailStateParam: state.sendEmailState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
        ),
      ),
    );

    final result = await _enterEmailUseCase(email: emailController.text);

    switch (result) {
      case Success():
        otpController.clear();
        emit(
          state.copyWith(
            sendEmailStateParam: state.sendEmailState.copyWith(
              isLoadingParam: false,
              isSuccessParam: true,
              errorMessageParam: null,
            ),
          ),
        );

      case Failure():
        emit(
          state.copyWith(
            sendEmailStateParam: state.sendEmailState.copyWith(
              isLoadingParam: false,
              isSuccessParam: false,
              errorMessageParam: result.errorMessage,
            ),
          ),
        );
    }
  }

  Future<void> _verifyOtp() async {
    emit(
      state.copyWith(
        verifyOtpStateParam: state.verifyOtpState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
          isSuccessParam: false,
        ),
      ),
    );

    final result = await _verifyOtpUseCase(otp: otpController.text);

    switch (result) {
      case Success():
        emit(
          state.copyWith(
            verifyOtpStateParam: state.verifyOtpState.copyWith(
              isLoadingParam: false,
              isSuccessParam: true,
              errorMessageParam: null,
            ),
          ),
        );

      case Failure():
        errorController.add(ErrorAnimationType.shake);
        otpController.clear();

        emit(
          state.copyWith(
            verifyOtpStateParam: state.verifyOtpState.copyWith(
              isLoadingParam: false,
              errorMessageParam: result.errorMessage,
            ),
          ),
        );
    }
  }

  Future<void> _resetPassword() async {
    if (!passwordFormKey.currentState!.validate()) {
      return;
    }

    emit(
      state.copyWith(
        resetPasswordStateParam: state.resetPasswordState.copyWith(
          isLoadingParam: true,
          errorMessageParam: null,
        ),
      ),
    );

    final result = await _resetPasswordUseCase(
      email: emailController.text,
      newPassword: passwordController.text,
    );

    switch (result) {
      case Success():
        emit(
          state.copyWith(
            resetPasswordStateParam: state.resetPasswordState.copyWith(
              isLoadingParam: false,
              isSuccessParam: true,
              errorMessageParam: null,
            ),
          ),
        );

      case Failure():
        emit(
          state.copyWith(
            resetPasswordStateParam: state.resetPasswordState.copyWith(
              isLoadingParam: false,
              errorMessageParam: result.errorMessage,
            ),
          ),
        );
    }
  }

  void validateEmailForm() {
    final valid = emailFormKey.currentState?.validate() ?? false;

    emit(state.copyWith(isEmailValidParam: valid));
  }

  void validatePasswordForm() {
    final valid = passwordFormKey.currentState?.validate() ?? false;

    emit(state.copyWith(isPasswordFormValidParam: valid));
  }

  @override
  Future<void> close() {
    errorController.close();
    emailController.dispose();
    otpController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
