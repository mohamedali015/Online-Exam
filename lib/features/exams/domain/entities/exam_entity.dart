import 'package:equatable/equatable.dart';

class ExamEntity extends Equatable {
  final String id;
  final String title;
  final int duration;
  final int numberOfQuestions;
  final String subjectName;
  final String icon;

  const ExamEntity({
    required this.id,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    required this.subjectName,
    required this.icon,
  });

  ExamEntity copyWith({
    String? idParam,
    String? titleParam,
    int? durationParam,
    int? numberOfQuestionsParam,
    String? subjectNameParam,
    String? iconParam,
  }) {
    return ExamEntity(
      id: idParam ?? id,
      title: titleParam ?? title,
      duration: durationParam ?? duration,
      numberOfQuestions: numberOfQuestionsParam ?? numberOfQuestions,
      subjectName: subjectNameParam ?? subjectName,
      icon: iconParam ?? icon,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    duration,
    numberOfQuestions,
    subjectName,
    icon,
  ];
}
