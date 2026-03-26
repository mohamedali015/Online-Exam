import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/cache/secure_cache/cache_keys.dart';
import 'package:online_exam/config/cache/secure_cache/secure_cache_helper.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/domain/entities/auth_entity.dart';
import 'package:online_exam/features/auth/domain/use_case/register_use_case.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_events.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase) : super(RegisterInitial());

  final RegisterUseCase _registerUseCase;

  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  void doEvents(RegisterEvents event) {
    switch (event) {
      case RegisterSubmitted():
        _register(event);
      case RegisterInitControllers():
        initControllers();
    }
  }

  void initControllers() {
    userNameController.addListener(_onFormChanged);
    firstNameController.addListener(_onFormChanged);
    lastNameController.addListener(_onFormChanged);
    emailController.addListener(_onFormChanged);
    passwordController.addListener(_onFormChanged);
    confirmPasswordController.addListener(_onFormChanged);
    phoneController.addListener(_onFormChanged);
  }

  void _onFormChanged() {
    final isValid =
        userNameController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        phoneController.text.isNotEmpty;

    emit(RegisterFormState(isValid));
  }

  Future<void> _register(RegisterSubmitted event) async {
    emit(RegisterLoading());

    final result = await _registerUseCase.call(
      userName: userNameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      phone: phoneController.text,
    );

    switch (result) {
      case Success<AuthEntity>():
        final token = result.data.token;

        if (token != null) {
          await SecureCacheHelper.saveData(key: CacheKeys.token, value: token);
        }

        emit(RegisterSuccess(result.data));
        break;

      case Failure<AuthEntity>():
        emit(RegisterFailure(result.errorMessage));
        break;
    }
  }
}
