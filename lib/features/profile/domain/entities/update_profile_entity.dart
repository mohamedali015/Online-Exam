import 'package:equatable/equatable.dart';

class UpdateProfileEntity extends Equatable {
  const UpdateProfileEntity({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  @override
  List<Object?> get props => [username, firstName, lastName, email, phone];
}
