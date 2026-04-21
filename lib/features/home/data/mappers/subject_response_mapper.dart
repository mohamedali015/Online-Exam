import 'package:online_exam/features/home/data/model/response/subject_response.dart';
import '../../domain/entities/get_all_subjects_entity.dart';

extension SubjectResponseMapper on SubjectResponse {
  SubjectEntity toEntity() {

    return SubjectEntity(
      id: id??'',
      icon: icon??'',
      name: name??'',
    );
  }
}