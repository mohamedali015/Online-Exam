import 'package:equatable/equatable.dart';
import 'package:online_exam/features/exams/domain/entities/exam_model.dart';

sealed class ExamsState extends Equatable {
  const ExamsState();

  @override
  List<Object> get props => [];
}

class ExamsInitial extends ExamsState {}

class ExamsLoading extends ExamsState {}

class ExamsSuccessState extends ExamsState {
  final List<ExamsModel> exams;
  ExamsSuccessState(this.exams);
}

class ExamsErrorState extends ExamsState {
  final String errorMessage;
  ExamsErrorState(this.errorMessage);
}
