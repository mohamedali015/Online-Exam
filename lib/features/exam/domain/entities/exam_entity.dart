import 'package:equatable/equatable.dart';
import 'package:online_exam/features/exam/domain/entities/questions_entity.dart';

class ExamEntity extends Equatable {
  String id;
  String title;
  int duration;
  String subject;
  int numberOfQuestions;
  List<QuestionsEntity> questions;

  ExamEntity({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.questions,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    duration,
    subject,
    numberOfQuestions,
    questions,
  ];
}
