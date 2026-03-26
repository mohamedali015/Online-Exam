import 'package:equatable/equatable.dart';
import 'package:online_exam/features/auth/domain/entities/auth_entity.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final AuthEntity authEntity;
  const RegisterSuccess(this.authEntity);
  @override
  List<Object> get props => [authEntity];
}

final class RegisterFailure extends RegisterState {
  final String errorMessage;

  const RegisterFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class RegisterFormState extends RegisterState {
  final bool isButtonEnabled;

  const RegisterFormState(this.isButtonEnabled);

  @override
  List<Object> get props => [isButtonEnabled];
}
