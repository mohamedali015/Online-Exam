import '../../../../../config/base_state/base_state.dart';

class ForgetPasswordState {
  BaseState<void> sendEmailState = BaseState();

  BaseState<void> verifyOtpState = BaseState();

  BaseState<void> resetPasswordState = BaseState();

  bool isEmailValid;
  bool isPasswordFormValid;

  bool passwordObsecure;
  bool confirmPasswordObsecure;

  ForgetPasswordState({
    BaseState<void>? sendEmailState,
    BaseState<void>? verifyOtpState,
    BaseState<void>? resetPasswordState,
    this.isEmailValid = false,
    this.isPasswordFormValid = false,
    this.passwordObsecure = true,
    this.confirmPasswordObsecure = true,
  }) {
    this.sendEmailState = sendEmailState ?? BaseState();
    this.verifyOtpState = verifyOtpState ?? BaseState();
    this.resetPasswordState = resetPasswordState ?? BaseState();
  }

  ForgetPasswordState copyWith({
    BaseState<void>? sendEmailStateParam,
    BaseState<void>? verifyOtpStateParam,
    BaseState<void>? resetPasswordStateParam,
    bool? isEmailValidParam,
    bool? isPasswordFormValidParam,
    bool? passwordObsecureParam,
    bool? confirmPasswordObsecureParam,
  }) {
    return ForgetPasswordState(
      sendEmailState: sendEmailStateParam ?? sendEmailState,
      verifyOtpState: verifyOtpStateParam ?? verifyOtpState,
      resetPasswordState: resetPasswordStateParam ?? resetPasswordState,
      isEmailValid: isEmailValidParam ?? isEmailValid,
      isPasswordFormValid: isPasswordFormValidParam ?? isPasswordFormValid,
      passwordObsecure: passwordObsecureParam ?? passwordObsecure,
      confirmPasswordObsecure:
          confirmPasswordObsecureParam ?? confirmPasswordObsecure,
    );
  }
}
