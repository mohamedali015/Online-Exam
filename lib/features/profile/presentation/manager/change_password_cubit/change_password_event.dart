import 'package:equatable/equatable.dart';

sealed class ChangePasswordEvent extends Equatable {}

class SubmitChangePasswordEvent extends ChangePasswordEvent {
  final String oldPassword;
  final String newPassword;
  final String rePassword;

  SubmitChangePasswordEvent({
    required this.oldPassword,
    required this.newPassword,
    required this.rePassword,
  });

  @override
  List<Object?> get props => [oldPassword, newPassword, rePassword];
}
