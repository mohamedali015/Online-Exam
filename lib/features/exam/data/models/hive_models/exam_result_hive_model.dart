import 'package:hive_ce_flutter/hive_flutter.dart';
import 'exam_hive_model.dart';
import 'question_hive_model.dart';

part 'exam_result_hive_model.g.dart';

@HiveType(typeId: 0)
class ExamResultHiveModel extends HiveObject {
  @HiveField(0)
  final ExamHiveModel exam;

  @HiveField(1)
  final List<QuestionHiveModel> questions;

  @HiveField(2)
  final int correctAnswers;

  @HiveField(3)
  final int wrongAnswers;

  @HiveField(4)
  final double percentage;

  @HiveField(5)
  final int spentMinutes;

  @HiveField(6)
  final DateTime date;

  ExamResultHiveModel({
    required this.exam,
    required this.questions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.percentage,
    required this.spentMinutes,
    required this.date,
  });
}
