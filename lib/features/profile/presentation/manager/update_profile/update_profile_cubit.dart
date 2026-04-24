import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam/features/profile/data/models/update_profile_request.dart';
import 'package:online_exam/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:online_exam/features/profile/presentation/manager/update_profile/update_profile_event.dart';
part 'update_profile_state.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._profileUseCase) : super(UpdateProfileInitial());

  final ProfileUseCase _profileUseCase;

  void doEvents(UpdateProfileEvents event) {
    switch (event) {
      case UpdateProfile():
        _updateProfile(event);
    }
  }

  Future<void> _updateProfile(UpdateProfile event) async {
    emit(UpdateProfileLoading());

    final request = UpdateProfileRequest(
      username: event.username ?? '',
      firstName: event.firstname ?? '',
      lastName: event.lastname ?? '',
      email: event.email ?? '',
      phone: event.phone ?? '',
    );
    final result = await _profileUseCase.call(request: request);

    switch (result) {
      case Success<UserEntity>():
        emit(UpdateProfileSuccess(result.data));
      case Failure<UserEntity>():
        emit(UpdateProfileError(result.errorMessage));
    }
  }
}
