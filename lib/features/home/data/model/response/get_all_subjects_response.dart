import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/home/data/model/response/pagination.dart';
import 'package:online_exam/features/home/data/model/response/subject_response.dart';

part 'get_all_subjects_response.g.dart';

@JsonSerializable()
class GetAllSubjectsResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "subjects")
  final List<SubjectResponse>? subjects;

  GetAllSubjectsResponse ({
    this.message,
    this.metadata,
    this.subjects,
  });

  factory GetAllSubjectsResponse.fromJson(Map<String, dynamic> json) {
    return _$GetAllSubjectsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllSubjectsResponseToJson(this);
  }
}






