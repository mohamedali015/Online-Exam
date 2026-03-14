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
  void doEvents(RegisterEvents event) {
    switch (event) {
      case RegisterFormChanged():
        _checkForm(event);
        break;

      case RegisterSubmitted():
        _register(event);
        break;
    }
  }

  void _checkForm(RegisterFormChanged event) {
    final isValid =
        event.userName.isNotEmpty &&
        event.firstName.isNotEmpty &&
        event.lastName.isNotEmpty &&
        event.email.isNotEmpty &&
        event.password.isNotEmpty &&
        event.confirmPassword.isNotEmpty &&
        event.phone.isNotEmpty;

    emit(RegisterFormState(isValid));
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
