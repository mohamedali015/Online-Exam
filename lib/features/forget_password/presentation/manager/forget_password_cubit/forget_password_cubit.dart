import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  /// Email Verification
  TextEditingController emailController = TextEditingController();

  void submitEmail() {
    // Validation handled in UI using a local Form key
    emit(ForgetPasswordLoading());
    // Simulate a network call or any async operation
    Future.delayed(Duration(seconds: 2), () {
      emit(ForgetPasswordSuccess());
    });
  }

  /// OTP Verification
  String otpCode = '';
  bool isOtpComplete = false;

  void onOtpChanged(String otp) {
    otpCode = otp;
    isOtpComplete = otp.length == 4; // Assuming OTP length is 4
    emit(ForgetPasswordOtpChanged());
  }

  void resendOtp() {
    emit(ForgetPasswordLoading());
    // Logic to resend OTP
    Future.delayed(Duration(seconds: 2), () {
      emit(ForgetPasswordToggle());
    });
  }

  void verifyOtp() {
    if (isOtpComplete) {
      emit(ForgetPasswordLoading());
      // Logic to verify OTP
      Future.delayed(Duration(seconds: 2), () {
        emit(ForgetPasswordSuccess());
      });
    } else {
      emit(ForgetPasswordError(error: 'Please enter a valid OTP'));
    }
  }

  /// New Password Submission
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool obsecure = true;
  bool confirmObsecure = true;

  void submitNewPassword() {
    // Validation handled in UI using a local Form key
    emit(ForgetPasswordLoading());
    // Simulate a network call or any async operation
    Future.delayed(Duration(seconds: 2), () {
      emit(ForgetPasswordSuccess());
    });
  }

  void changeObsecurePassword() {
    obsecure = !obsecure;
    emit(ForgetPasswordToggle());
  }

  void changeConfirmObsecurePassword() {
    confirmObsecure = !confirmObsecure;
    emit(ForgetPasswordToggle());
  }
}
