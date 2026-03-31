import 'package:equatable/equatable.dart';

class ExamsModel extends Equatable {
  final String title;
  final int duration;
  final int numberOfQuestions;

  const ExamsModel({
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
  });

  @override
  List<Object?> get props => [title, duration, numberOfQuestions];
}
