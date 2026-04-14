import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import '../../../../../config/cache/secure_cache/cache_keys.dart';
import '../../../../../config/cache/secure_cache/secure_cache_helper.dart';
import 'login_state.dart';
import '../../../domain/use_case/login_use_case.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase)
      : super(const LoginInitialState());

  void changeRememberMe(bool value) {
    final currentState = state as LoginInitialState;
    emit(currentState.copyWith(rememberMe: value));
  }

  void validateForm(bool isValid) {
    final currentState = state as LoginInitialState;
    emit(currentState.copyWith(isFormValid: isValid));
  }

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final currentState = state as LoginInitialState;

  Future<void> loginWithEmailAndPassword() async {
    if (!formKey.currentState!.validate()) {
      emit(LoginInitialState(isFormValid: false));
      return;
    }

    emit(const LoginLoadingState());

    final resultLogin = await _loginUseCase.call(
      email: email.trim(),
      password: password.trim(),
      rememberMe: currentState.rememberMe,
    );

    switch (resultLogin) {
      case Success():
        emit(LoginSuccessState(resultLogin.data));

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
        emit(LoginFailureState(resultLogin.errorMessage));
    }
  }
}