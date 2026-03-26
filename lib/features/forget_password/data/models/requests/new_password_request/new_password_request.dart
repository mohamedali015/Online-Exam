import 'package:json_annotation/json_annotation.dart';

part 'new_password_request.g.dart';

@JsonSerializable()
class NewPasswordRequest {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "newPassword")
  String? newPassword;

  NewPasswordRequest({this.email, this.newPassword});

  factory NewPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$NewPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NewPasswordRequestToJson(this);
}
