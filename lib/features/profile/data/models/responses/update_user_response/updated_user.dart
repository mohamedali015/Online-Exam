import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
part 'updated_user.g.dart';

@JsonSerializable()
class UpdatedUser {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "username")
  final String? username;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  UpdatedUser({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
  });

  UserEntity toEntity() {
    return UserEntity(
      id: id ?? '',
      username: username ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      phone: phone ?? '',
    );
  }

  factory UpdatedUser.fromJson(Map<String, dynamic> json) {
    return _$UpdatedUserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdatedUserToJson(this);
  }
}
