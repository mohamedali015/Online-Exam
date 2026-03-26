abstract class ForgetPasswordOtpState {}

class ForgetPasswordOtpInitial extends ForgetPasswordOtpState {}

class ForgetPasswordOtpLoading extends ForgetPasswordOtpState {}

class ForgetPasswordOtpVerified extends ForgetPasswordOtpState {}

class ForgetPasswordOtpResend extends ForgetPasswordOtpState {}

class ForgetPasswordOtpFailure extends ForgetPasswordOtpState {
  final String errorMessage;

  ForgetPasswordOtpFailure(this.errorMessage);
}

class ForgetPasswordOtpChanged extends ForgetPasswordOtpState {}
