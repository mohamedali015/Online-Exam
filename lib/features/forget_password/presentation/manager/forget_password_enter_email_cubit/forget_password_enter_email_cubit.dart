import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/forget_password/domain/use_cases/enter_email_forget_password_use_case.dart';

import '../../../../../config/error_handling/result.dart';
import 'forget_password_enter_email_state.dart';

@injectable
class ForgetPasswordEnterEmailCubit
    extends Cubit<ForgetPasswordEnterEmailState> {
  ForgetPasswordEnterEmailCubit(this.enterEmailUseCase)
    : super(ForgetPasswordEnterEmailInitial());

  static ForgetPasswordEnterEmailCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isFormValid = false;

  EnterEmailUseCase enterEmailUseCase;

  void validateForm() {
    isFormValid = formKey.currentState?.validate() ?? false;
    emit(ForgetPasswordEnterEmailInitial());
  }

  void submitEmail() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(ForgetPasswordEnterEmailLoading());
    // Simulate a network call or any async operation
    var result = await enterEmailUseCase.call(email: emailController.text);

    switch (result) {
      case Success():
        {
          emit(ForgetPasswordEnterEmailSuccess());
        }
      case Failure():
        {
          emit(ForgetPasswordEnterEmailFailure(result.errorMessage));
        }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
