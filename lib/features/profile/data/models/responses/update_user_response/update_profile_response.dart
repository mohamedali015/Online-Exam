import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/profile/data/models/responses/update_user_response/updated_user_data.dart';

part 'update_profile_response.g.dart';

@JsonSerializable()
class UpdateProfileResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UpdatedUserData? user;

  UpdateProfileResponse({this.message, this.user});

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$UpdateProfileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateProfileResponseToJson(this);
  }
}
