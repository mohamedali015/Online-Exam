import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/domain/entities/auth_entity.dart';
import 'package:online_exam/features/auth/domain/use_case/register_use_case.dart';
import 'register_events.dart';
import 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerUseCase) : super(RegisterInitial());

  final RegisterUseCase _registerUseCase;

  void doEvents(RegisterEvents event) {
    switch (event) {
      case RegisterSubmitted():
        _register(event);
    }
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
}
