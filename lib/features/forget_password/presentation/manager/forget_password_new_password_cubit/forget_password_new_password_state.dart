import 'package:equatable/equatable.dart';

abstract class ForgetPasswordNewPasswordState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ForgetPasswordNewPasswordInitial extends ForgetPasswordNewPasswordState {}

class ForgetPasswordNewPasswordLoading extends ForgetPasswordNewPasswordState {}

class ForgetPasswordNewPasswordSuccess extends ForgetPasswordNewPasswordState {}

class ForgetPasswordNewPasswordFailure extends ForgetPasswordNewPasswordState {
  final String errorMessage;

  ForgetPasswordNewPasswordFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ForgetPasswordNewPasswordToggled extends ForgetPasswordNewPasswordState {}
