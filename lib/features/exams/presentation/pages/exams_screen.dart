import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/features/exams/presentation/manager/exams_cubit/exams_cubit.dart';
import 'package:online_exam/features/exams/presentation/manager/exams_cubit/exams_events.dart';
import 'package:online_exam/features/exams/presentation/manager/exams_cubit/exams_states.dart';
import 'package:online_exam/features/exams/presentation/widgets/exams_list.dart';

class ExamsScreen extends StatelessWidget {
  final String subjectId;
  ExamsScreen({super.key, required this.subjectId});

  ExamsCubit examsCubit = getIt.get<ExamsCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: BlocProvider<ExamsCubit>(
        create: (context) => examsCubit..doEvent(GetSubjectExams(subjectId)),
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
