import 'package:equatable/equatable.dart';

import '../../domain/entities/get_all_subjects_entity.dart';

class SubjectsState extends Equatable {
  final bool isLoading;
  final List<SubjectEntity> allSubjects;
  final List<SubjectEntity> subjects;
  final String? errorMessage;

  const SubjectsState({
    this.isLoading = false,
    this.allSubjects = const [],
    this.subjects = const [],
    this.errorMessage,
  });

  SubjectsState copyWith({
    bool? isLoading,
    List<SubjectEntity>? subjects,
    List<SubjectEntity>? allSubjects,
    String? errorMessage,
  }) {
    return SubjectsState(
      isLoading: isLoading ?? this.isLoading,
      subjects: subjects ?? this.subjects,
      allSubjects: allSubjects ?? this.allSubjects,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, subjects, allSubjects, errorMessage];
}