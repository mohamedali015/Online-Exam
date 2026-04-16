import 'package:equatable/equatable.dart';
import '../../../domain/entities/auth_entity.dart';

sealed class LoginState extends Equatable {
  final bool isFormValid;
  final bool rememberMe;

  const LoginState({
    this.isFormValid = false,
    this.rememberMe = false,
  });

  @override
  List<Object?> get props => [isFormValid, rememberMe];
}

class LoginInitialState extends LoginState {
  const LoginInitialState({
    super.isFormValid,
    super.rememberMe,
  });

  LoginInitialState copyWith({
    bool? isFormValid,
    bool? rememberMe,
  }) {
    return LoginInitialState(
      isFormValid: isFormValid ?? this.isFormValid,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

class LoginSuccessState extends LoginState {
  final AuthEntity authEntity;

  const LoginSuccessState(this.authEntity);

  @override
  List<Object?> get props => [authEntity];
}

class LoginFailureState extends LoginState {
  final String errorMessage;

  const LoginFailureState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}