import 'package:hive_ce_flutter/hive_flutter.dart';
import 'answer_hive_model.dart';

part 'question_hive_model.g.dart';

@HiveType(typeId: 2)
class QuestionHiveModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String question;

  @HiveField(2)
  final List<AnswerHiveModel> answers;

  @HiveField(3)
  final String correct;

  @HiveField(4)
  final String userAnswer;

  @HiveField(5)
  final int type; // enum index

  QuestionHiveModel({
    required this.id,
    required this.question,
    required this.answers,
    required this.correct,
    required this.userAnswer,
    required this.type,
  });
}
