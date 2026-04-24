import 'package:hive_ce_flutter/hive_flutter.dart';

part 'answer_hive_model.g.dart';

@HiveType(typeId: 3)
class AnswerHiveModel {
  @HiveField(0)
  final String answer;

  @HiveField(1)
  final String key;

  AnswerHiveModel({required this.answer, required this.key});
}
