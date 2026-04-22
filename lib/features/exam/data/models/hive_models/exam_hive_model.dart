import 'package:hive_ce_flutter/hive_flutter.dart';

part 'exam_hive_model.g.dart';

@HiveType(typeId: 1)
class ExamHiveModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int duration;

  @HiveField(3)
  final int numberOfQuestions;

  @HiveField(4)
  final String subjectName;

  ExamHiveModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    required this.subjectName,
  });
}
