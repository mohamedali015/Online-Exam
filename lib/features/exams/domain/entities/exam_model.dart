import 'package:equatable/equatable.dart';

class ExamsModel extends Equatable {
  final String id;
  final String title;
  final int duration;
  final int numberOfQuestions;
  final String subjectName;

  const ExamsModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    required this.subjectName,
  });

  ExamsModel copyWith({
    String? idParam,
    String? titleParam,
    int? durationParam,
    int? numberOfQuestionsParam,
    String? subjectNameParam,
  }) {
    return ExamsModel(
      id: idParam ?? id,
      title: titleParam ?? title,
      duration: durationParam ?? duration,
      numberOfQuestions: numberOfQuestionsParam ?? numberOfQuestions,
      subjectName: subjectNameParam ?? subjectName,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    duration,
    numberOfQuestions,
    subjectName,
  ];
}
