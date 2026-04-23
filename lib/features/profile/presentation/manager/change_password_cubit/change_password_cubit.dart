import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/error_handling/result.dart';
import '../../../domain/entities/change_password_entity.dart';
import '../../../domain/use_cases/change_password_use_case.dart';
import 'change_password_event.dart';
import 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._changePasswordUseCase)
    : super(const ChangePasswordState());

  final ChangePasswordUseCase _changePasswordUseCase;

  void doEvent(ChangePasswordEvent event) {
    switch (event) {
      case SubmitChangePasswordEvent():
        _changePassword(
          oldPassword: (event.oldPassword),
          newPassword: (event.newPassword),
          rePassword: (event.rePassword),
        );
        break;
    }
  }

  Future<void> _changePassword({
    required String oldPassword,
    required String newPassword,
    required String rePassword,
  }) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    final result = await _changePasswordUseCase.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      rePassword: rePassword,
    );

    switch (result) {
      case Success<ChangePasswordEntity>():
        emit(
          state.copyWith(isLoading: false, isSuccess: true, errorMessage: null),
        );
        break;

      case Failure<ChangePasswordEntity>():
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: false,
            errorMessage: result.errorMessage,
          ),
        );
        break;
    }
  }
}
