import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/profile/domain/use_cases/get_user_data_use_case.dart';
import 'package:online_exam/features/profile/presentation/manager/user_state.dart';
import 'package:online_exam/features/profile/presentation/manager/user_events.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam/config/error_handling/result.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._getUserDataUseCase) : super(UserInitial());

  static UserCubit get(BuildContext context) => BlocProvider.of(context);

  final GetUserDataUseCase _getUserDataUseCase;

  UserEntity? user;

  Future<void> doEvent(UserEvents event) async {
    switch (event) {
      case GetUserData():
        await _getUserData();
    }
  }

  Future<void> _getUserData() async {
    emit(UserLoading());

    final response = await _getUserDataUseCase.call();

    switch (response) {
      case Success():
        user = response.data;
        emit(GetUserDataSuccessState(user!));
        break;

      case Failure():
        emit(GetUserDataErrorState(response.errorMessage));
        break;
    }
  }
}
