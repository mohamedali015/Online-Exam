import 'package:equatable/equatable.dart';

class ExamEntity extends Equatable {
  final String id;
  final String title;
  final int duration;
  final int numberOfQuestions;

  const ExamEntity({
    required this.id,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
  });

  @override
  List<Object?> get props => [id, title, duration, numberOfQuestions];
}
