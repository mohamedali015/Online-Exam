import 'package:json_annotation/json_annotation.dart';

part 'enter_email_request.g.dart';

@JsonSerializable()
class EnterEmailRequest {
  @JsonKey(name: "email")
  final String? email;

  EnterEmailRequest({this.email});

  factory EnterEmailRequest.fromJson(Map<String, dynamic> json) {
    return _$EnterEmailRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EnterEmailRequestToJson(this);
  }
}
