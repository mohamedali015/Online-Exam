import '../../../features/auth/domain/entities/user_entity.dart';

sealed class UserEvents {}

class GetUserData extends UserEvents {}

class SetUserData extends UserEvents {
  final UserEntity user;

  SetUserData({required this.user});
}
