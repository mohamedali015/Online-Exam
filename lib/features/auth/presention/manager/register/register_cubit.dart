import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/domain/entities/auth_entity.dart';
import 'package:online_exam/features/auth/domain/use_case/register_use_case.dart';
import 'register_events.dart';
import 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase)
    : super(RegisterFormState(isButtonEnabled: true, hasSubmitted: false));

  final RegisterUseCase _registerUseCase;

  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  void doEvents(RegisterEvents event) {
    if (event is RegisterSubmitted) {
      _register(event);
    } else if (event is RegisterValidateForm) {
      _validateForm(markSubmitted: event.markSubmitted);
    }
  }

  void _validateForm({bool markSubmitted = false}) {
    final isValid =
        userNameController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        phoneController.text.isNotEmpty;

    final currentState = state;
    bool shouldEnable;

    if (markSubmitted) {
      shouldEnable = isValid;
    } else {
      shouldEnable = true;
    }

    if (currentState is RegisterFormState && currentState.hasSubmitted) {
      shouldEnable = isValid;
    }

    emit(
      RegisterFormState(
        isButtonEnabled: shouldEnable,
        hasSubmitted:
            markSubmitted ||
            (currentState is RegisterFormState && currentState.hasSubmitted),
      ),
    );
  }

  Future<void> _register(RegisterSubmitted event) async {
    emit(RegisterLoading());

    final result = await _registerUseCase.call(
      userName: event.userName,
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
      password: event.password,
      confirmPassword: event.confirmPassword,
      phone: event.phone,
    );

    switch (result) {
      case Success<AuthEntity>():
        emit(RegisterSuccess(result.data));
      case Failure<AuthEntity>():
        emit(RegisterFailure(result.errorMessage));
    }
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
