import 'package:equatable/equatable.dart';
import '../../../domain/entities/auth_entity.dart';

sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final AuthEntity authEntity;
  LoginSuccessState(this.authEntity);
  @override
  List<Object?> get props => [authEntity];
}

class LoginFailureState extends LoginState {
  final String errorMessage;
  LoginFailureState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
