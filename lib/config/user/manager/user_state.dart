import '../../../features/auth/domain/entities/user_entity.dart';

class UserState {
  final bool isLoading;
  final UserEntity? user;
  final String? error;

  UserState({
    this.isLoading = false,
    this.user,
    this.error,
  });

  UserState copyWith({
    bool? isLoading,
    UserEntity? user,
    String? error,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}