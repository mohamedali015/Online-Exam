import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/presentation/manager/login/login_state.dart';
import '../../../../../config/cache/secure_cache/cache_keys.dart';
import '../../../../../config/cache/secure_cache/secure_cache_helper.dart';
import '../../../domain/use_case/login_use_case.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginInitialState(isFormValid: true));

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isRememberMe = false;

  void changeRememberMe(bool value) {
    isRememberMe = value;
    emit(LoginInitialState(isFormValid: state.isFormValid));
  }

  /// validate form and emit state
  void validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    emit(LoginInitialState(isFormValid: isValid));
  }

  /// login function
  Future<void> loginWithEmailAndPassword() async {
    // لو الفورم غلط اضرب error
    if (!formKey.currentState!.validate()) {
      emit(LoginInitialState(isFormValid: false));
      return;
    }

    emit(const LoginLoadingState());

    final result = await _loginUseCase.call(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    switch (result) {
      case Success():
        final token = result.data.token;
        if (isRememberMe && token != null) {
          await SecureCacheHelper.saveData(
            key: CacheKeys.token,
            value: token,
          );
        }
        emit(LoginSuccessState(result.data));
      case Failure():
        emit(LoginFailureState(result.errorMessage));
    }
  }
}