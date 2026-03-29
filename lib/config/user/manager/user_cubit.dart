import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/config/user/domain/use_cases/get_user_data_use_case.dart';
import 'package:online_exam/config/user/manager/user_events.dart';
import 'package:online_exam/config/user/manager/user_state.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._getUserDataUseCase) : super(UserState());

  static UserCubit get(BuildContext context) => BlocProvider.of(context);

  final GetUserDataUseCase _getUserDataUseCase;

  UserEntity user = UserEntity();

  /// events
  dynamic doEvent(UserEvents event) async {
    switch (event) {
      case GetUserData():
        {
          return await _getUserData();
        }
    }
  }

  /// get user data
  Future<bool> _getUserData() async {
    var response = await _getUserDataUseCase.call();
    switch (response) {
      case Success():
        {
          user = response.data;
          return true;
        }
      case Failure():
        {
          return false;
        }
    }
  }
}
