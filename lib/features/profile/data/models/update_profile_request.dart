import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  UpdateProfileRequest({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}
