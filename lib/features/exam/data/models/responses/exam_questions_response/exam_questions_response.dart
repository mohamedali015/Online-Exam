import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/exam/domain/entities/questions_entity.dart';

part 'exam_questions_response.g.dart';

@JsonSerializable()
class ExamQuestionsResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "questions")
  List<Question>? questions;

  ExamQuestionsResponse({this.message, this.questions});

  factory ExamQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExamQuestionsResponseToJson(this);
}

@JsonSerializable()
class Question {
  @JsonKey(name: "answers")
  List<Answer>? answers;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "question")
  String? question;
  @JsonKey(name: "correct")
  String? correct;
  @JsonKey(name: "subject")
  dynamic subject;
  @JsonKey(name: "exam")
  Exam? exam;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  QuestionsEntity toQuestionsEntity() {
    return QuestionsEntity(
      type: type == 'single_choice'
          ? QuestionType.singleChoice
          : QuestionType.multipleChoice,
      id: id ?? '',
      question: question ?? '',
      answers: answers?.map((e) => e.toAnswerEntity()).toList() ?? [],
      correct: correct ?? '',
      userAnswer: '',
    );
  }
}

@JsonSerializable()
class Answer {
  @JsonKey(name: "answer")
  String? answer;
  @JsonKey(name: "key")
  String? key;

  Answer({this.answer, this.key});

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  AnswerEntity toAnswerEntity() {
    return AnswerEntity(answer: answer ?? '', key: key ?? '');
  }
}

@JsonSerializable()
class Exam {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "duration")
  int? duration;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "numberOfQuestions")
  int? numberOfQuestions;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);
}
