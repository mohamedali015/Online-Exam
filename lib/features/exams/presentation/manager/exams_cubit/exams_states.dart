import 'package:equatable/equatable.dart';
import 'package:online_exam/features/exams/domain/entities/exam_entity.dart';

sealed class ExamsState extends Equatable {
  const ExamsState();

  @override
  List<Object> get props => [];
}

class ExamsInitial extends ExamsState {}

class ExamsLoading extends ExamsState {}

class ExamsSuccessState extends ExamsState {
  final List<ExamEntity> exams;

  const ExamsSuccessState(this.exams);
}

class ExamsErrorState extends ExamsState {
  final String errorMessage;

  const ExamsErrorState(this.errorMessage);
}
