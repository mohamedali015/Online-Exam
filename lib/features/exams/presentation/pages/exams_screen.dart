import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/core/utils/app_colors.dart';
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
        title: Text(item.name!),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: BlocProvider<ExamsCubit>(
        create: (context) =>
            examsCubit..doEvent(GetSubjectExams(subjectId: item.id!)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              BlocBuilder<ExamsCubit, ExamsState>(
                builder: (context, state) {
                  if (state is ExamsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.baseGray,
                      ),
                    );
                  } else if (state is ExamsSuccessState &&
                      state.exams.isNotEmpty) {
                    return ExamsList(title: 'Exams', exams: state.exams);
                  } else if (state is ExamsSuccessState &&
                      state.exams.isEmpty) {
                    return const Center(child: Text('No exams available'));
                  } else if (state is ExamsErrorState) {
                    return ExamsList(errorMessage: state.errorMessage);
                  }

                  return const SizedBox(); // initial state
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
