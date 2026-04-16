import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  const UserEntity({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
  });

  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  @override
  List<Object?> get props => [id, username, firstName, lastName, email, phone, role, isVerified];
}
