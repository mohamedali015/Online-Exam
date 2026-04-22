import 'package:equatable/equatable.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class GetUserDataSuccessState extends UserState {
  final UserEntity user;

  const GetUserDataSuccessState(this.user);

  @override
  List<Object> get props => [user];
}

class GetUserDataErrorState extends UserState {
  final String errorMessage;

  const GetUserDataErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
