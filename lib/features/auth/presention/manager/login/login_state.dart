import 'package:equatable/equatable.dart';
import '../../../domain/entities/auth_entity.dart';

sealed class LoginState extends Equatable {
  final bool isFormValid;
  const LoginState({this.isFormValid = false});
  @override
  List<Object?> get props => [isFormValid];
}

class LoginInitialState extends LoginState {
  const LoginInitialState({super.isFormValid});
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState({super.isFormValid});
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
