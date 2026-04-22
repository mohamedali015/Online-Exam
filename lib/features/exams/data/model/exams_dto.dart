import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';
part 'exams_dto.g.dart';

@JsonSerializable()
class Exams {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Exams({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  ExamsModel toEntity() {
    return ExamsModel(
      id: id ?? '',
      title: title ?? '',
      duration: duration ?? 0,
      numberOfQuestions: numberOfQuestions ?? 0,
      subjectName: '',
    );
  }

  factory Exams.fromJson(Map<String, dynamic> json) {
    return _$ExamsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamsToJson(this);
  }
}
