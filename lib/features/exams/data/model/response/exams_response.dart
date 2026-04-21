import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/exams/data/model/exams_dto.dart';
import 'package:online_exam/features/exams/data/model/meta_data.dart';

part 'exams_response.g.dart';

@JsonSerializable()
class ExamsResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "exams")
  final List<Exams>? exams;

  ExamsResponse({this.message, this.metadata, this.exams});

  factory ExamsResponse.fromJson(Map<String, dynamic> json) {
    return _$ExamsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsResponseToJson(this);
  }
}
