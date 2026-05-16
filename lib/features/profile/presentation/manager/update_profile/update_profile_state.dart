part of 'update_profile_cubit.dart';

sealed class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

final class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {
  final UserEntity updateProfile;

  const UpdateProfileSuccess(this.updateProfile);

  @override
  List<Object> get props => [updateProfile];
}

final class UpdateProfileError extends UpdateProfileState {
  final String errorMessage;

  const UpdateProfileError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
