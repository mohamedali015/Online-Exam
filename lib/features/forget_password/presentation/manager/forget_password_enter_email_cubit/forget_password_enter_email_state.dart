abstract class ForgetPasswordEnterEmailState {}

class ForgetPasswordEnterEmailInitial extends ForgetPasswordEnterEmailState {}

class ForgetPasswordEnterEmailLoading extends ForgetPasswordEnterEmailState {}

class ForgetPasswordEnterEmailSuccess extends ForgetPasswordEnterEmailState {}

class ForgetPasswordEnterEmailFailure extends ForgetPasswordEnterEmailState {
  final String errorMessage;

  ForgetPasswordEnterEmailFailure(this.errorMessage);
}
