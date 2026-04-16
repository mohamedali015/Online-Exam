import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/auth/data/model/response/user_response.dart';

import '../../../domain/entities/auth_entity.dart';
import '../../../domain/entities/user_entity.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserResponse? user;

  AuthResponse ({
    this.message,
    this.token,
    this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AuthResponseToJson(this);
  }

  AuthEntity toEntity() {
    return AuthEntity(
      message: message,
      token: token,
      user: user?.toUserEntity(),
    );
  }
}



