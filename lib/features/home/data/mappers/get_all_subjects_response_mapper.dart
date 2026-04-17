import 'package:online_exam/features/home/data/mappers/subject_response_mapper.dart';
import 'package:online_exam/features/home/data/model/response/get_all_subjects_response.dart';
import '../../domain/entities/get_all_subjects_entity.dart';

extension GetAllSubjectsResponseMapper on GetAllSubjectsResponse {
  List<SubjectEntity> toEntity() {
    return subjects?.map((subject) => subject.toEntity()).toList() ?? [];
  }
}