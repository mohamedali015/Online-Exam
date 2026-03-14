import 'package:equatable/equatable.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
class AuthEntity extends Equatable{
  AuthEntity({
      this.message, 
      this.token, 
      this.user,});

  String? message;
  String? token;
  UserEntity? user;

  @override
  List<Object?> get props => [message,token,user];

}