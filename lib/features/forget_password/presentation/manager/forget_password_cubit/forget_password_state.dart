abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {}

class ForgetPasswordError extends ForgetPasswordState {
  final String error;

  ForgetPasswordError({required this.error});
}

class ForgetPasswordOtpChanged extends ForgetPasswordState {}

class ForgetPasswordToggle extends ForgetPasswordState {}
