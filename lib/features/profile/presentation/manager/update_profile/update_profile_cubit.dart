import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/config/error_handling/result.dart';
import 'package:online_exam/features/profile/domain/entities/update_profile_entity.dart';
import 'package:online_exam/features/profile/domain/use_cases/update_profile_use_case.dart';
import 'package:online_exam/features/profile/presentation/manager/update_profile/update_profile_event.dart';
part 'update_profile_state.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._updateProfileUseCase)
    : super(UpdateProfileInitial());

  final UpdateProfileUseCase _updateProfileUseCase;

  void doEvents(UpdateProfileEvents event) {
    switch (event) {
      case UpdateProfile():
        updateProfile(event);
    }
  }

  Future<void> updateProfile(UpdateProfile event) async {
    emit(UpdateProfileLoading());

    final body = _buildBody(event);

    final result = await _updateProfileUseCase.call(body: body);

    switch (result) {
      case Success<UpdateProfileEntity>():
        emit(UpdateProfileSuccess(result.data));
      case Failure<UpdateProfileEntity>():
        emit(UpdateProfileError(result.errorMessage));
    }
  }

  Map<String, dynamic> _buildBody(UpdateProfile event) {
    final data = <String, dynamic>{};

    if (event.username != null) data["username"] = event.username;
    if (event.firstname != null) data["firstName"] = event.firstname;
    if (event.lastname != null) data["lastName"] = event.lastname;
    if (event.email != null) data["email"] = event.email;
    if (event.phone != null) data["phone"] = event.phone;

    return data;
  }
}
