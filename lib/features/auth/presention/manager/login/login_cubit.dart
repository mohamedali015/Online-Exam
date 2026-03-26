import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import '../../../../../config/cache/secure_cache/cache_keys.dart';
import '../../../../../config/cache/secure_cache/secure_cache_helper.dart';
import '../../../domain/use_case/login_use_case.dart';
import 'login_state.dart';

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


  void validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    emit(LoginInitialState(isFormValid: isValid));
  }


  Future<void> loginWithEmailAndPassword() async {
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
        if (token != null) {

          await SecureCacheHelper.saveData(
            key: CacheKeys.token,
            value: token,
          );

          await SecureCacheHelper.saveData(
            key: CacheKeys.rememberMe,
            value: isRememberMe.toString(),
          );
        }
        emit(LoginSuccessState(result.data));
      case Failure():
        emit(LoginFailureState(result.errorMessage));
    }
  }
}