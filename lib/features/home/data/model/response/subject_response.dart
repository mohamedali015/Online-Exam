import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/get_all_subjects_entity.dart';

part 'subject_response.g.dart';
@JsonSerializable()
class SubjectResponse {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  SubjectResponse ({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) {
    return _$SubjectResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectResponseToJson(this);
  }



}