import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/exams/presentation/manager/exams_cubit/exams_cubit.dart';
import 'package:online_exam/features/exams/presentation/manager/exams_cubit/exams_events.dart';
import 'package:online_exam/features/exams/presentation/manager/exams_cubit/exams_states.dart';
import 'package:online_exam/features/exams/presentation/widgets/exams_list.dart';

import '../../../home/domain/entities/get_all_subjects_entity.dart';

class ExamsScreen extends StatelessWidget {
  final SubjectEntity item;

  ExamsScreen({super.key, required this.item});

  final ExamsCubit examsCubit = getIt.get<ExamsCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name ?? ''),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: BlocProvider<ExamsCubit>(
        create: (context) {
          if (item.id == null) {
            return examsCubit;
          }
          return examsCubit..doEvent(GetSubjectExams(subjectId: item.id!));
        },
        child: BlocBuilder<ExamsCubit, ExamsState>(
          builder: (context, state) {
            switch (state) {
              case ExamsLoading():
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.baseGray),
                );

              case ExamsSuccessState():
                final exams = state.exams;

                if (exams.isEmpty) {
                  return const Center(child: Text(AppStrings.noExamsAvailable));
                }

                return ExamsList(title: AppStrings.exams, exams: exams);

              case ExamsErrorState():
                return Center(child: Text(state.errorMessage));

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
