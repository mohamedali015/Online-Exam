import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'login_state.dart';
import '../../../domain/use_case/login_use_case.dart';

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

    emit(const LoginLoadingState());

    final resultLogin = await _loginUseCase.call(
      email: email.trim(),
      password: password.trim(),
      rememberMe: currentState.rememberMe,
    );

    switch (resultLogin) {
      case Success():
        emit(LoginSuccessState(resultLogin.data));

      case Failure():
        emit(LoginFailureState(resultLogin.errorMessage));
    }
  }
}