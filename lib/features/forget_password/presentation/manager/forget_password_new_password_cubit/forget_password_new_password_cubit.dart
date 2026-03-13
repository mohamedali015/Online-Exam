import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/utils/app_constants.dart';
import 'package:online_exam/features/forget_password/domain/use_cases/get_new_password_forget_password_use_case.dart';

import '../../../../../config/error_handling/result.dart';
import 'forget_password_new_password_state.dart';

class ForgetPasswordNewPasswordCubit
    extends Cubit<ForgetPasswordNewPasswordState> {
  ForgetPasswordNewPasswordCubit(this.getNewPasswordUseCase)
    : super(ForgetPasswordNewPasswordInitial());

  static ForgetPasswordNewPasswordCubit get(context) =>
      BlocProvider.of(context);

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  bool obsecure = true;
  bool confirmObsecure = true;
  bool isFormValid = false;

  GetNewPasswordForgetPasswordUseCase getNewPasswordUseCase;

  void submitNewPassword() async {
    if (!passwordFormKey.currentState!.validate()) {
      return;
    }
    emit(ForgetPasswordNewPasswordLoading());
    var result = await getNewPasswordUseCase.call(
      email: AppConstants.forgetPasswordEmail!,
      newPassword: passwordController.text,
    );

    switch (result) {
      case Success():
        {
          emit(ForgetPasswordNewPasswordSuccess());
        }
      case Failure():
        {
          emit(ForgetPasswordNewPasswordFailure(result.errorMessage));
        }
    }
  }

  void validateForm() {
    isFormValid = passwordFormKey.currentState?.validate() ?? false;
    emit(ForgetPasswordNewPasswordInitial());
  }

  // void changeObsecurePassword() {
  //   obsecure = !obsecure;
  //   emit(ForgetPasswordNewPasswordToggled());
  // }
  //
  // void changeConfirmObsecurePassword() {
  //   confirmObsecure = !confirmObsecure;
  //   emit(ForgetPasswordNewPasswordToggled());
  // }

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
