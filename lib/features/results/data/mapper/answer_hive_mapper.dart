import '../../../exam/data/models/hive_models/answer_hive_model.dart';
import '../../../exam/domain/entities/questions_entity.dart';

extension AnswerHiveMapper on AnswerHiveModel {
  AnswerEntity toEntity() {
    return AnswerEntity(answer: answer, key: key);
  }
}
