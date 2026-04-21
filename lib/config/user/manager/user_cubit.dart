import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/user/manager/user_events.dart';
import 'package:online_exam/config/user/manager/user_state.dart';

import '../../error_handling/result.dart';
import '../domain/use_cases/get_user_data_use_case.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._getUserDataUseCase) : super(UserState());

  final GetUserDataUseCase _getUserDataUseCase;

  /// events
  void doEvent(UserEvents event) {
    switch (event) {
      case GetUserData():
        {
          _getUserData();
          break;
        }
      case SetUserData():
        {
          emit(state.copyWith(user: event.user));
          break;
        }
    }
  }

  Future<void> _getUserData() async {
    emit(state.copyWith(isLoading: true));

    final response = await _getUserDataUseCase.call();

    switch (response) {
      case Success():
        emit(state.copyWith(isLoading: false, user: response.data));
        break;

      case Failure():
        emit(state.copyWith(isLoading: false, error: response.errorMessage));
        break;
    }
  }
}
