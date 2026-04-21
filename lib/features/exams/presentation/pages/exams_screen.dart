import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/core/shared_widgets/custom_error_widget.dart';
import 'package:online_exam/core/shared_widgets/custom_loading_indicator.dart';
import 'package:online_exam/features/exams/presentation/manager/exams_cubit/exams_cubit.dart';
import 'package:online_exam/features/exams/presentation/manager/exams_cubit/exams_events.dart';
import 'package:online_exam/features/exams/presentation/manager/exams_cubit/exams_states.dart';
import 'package:online_exam/features/exams/presentation/widgets/exams_list.dart';

import '../../../home/domain/entities/get_all_subjects_entity.dart';

class ExamsScreen extends StatelessWidget {
  final SubjectEntity item;

  const ExamsScreen({super.key, required this.item});

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
            getIt<ExamsCubit>()..doEvent(GetSubjectExams(subjectId: item.id!)),
        child: Builder(
          builder: (context) {
            return BlocBuilder<ExamsCubit, ExamsState>(
              builder: (context, state) {
                if (state is ExamsLoading) {
                  return CustomLoadingIndicator();
                }

                if (state is ExamsSuccessState && state.exams.isNotEmpty) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [ExamsList(title: 'Exams', exams: state.exams)],
                    ),
                  );
                }

                if (state is ExamsSuccessState && state.exams.isEmpty) {
                  return CustomErrorWidget(errorMessage: 'No exams available');
                }

                if (state is ExamsErrorState) {
                  return CustomErrorWidget(
                    errorMessage: state.errorMessage,
                    haveTryAgain: true,
                    onPressed: () {
                      context.read<ExamsCubit>().doEvent(
                        GetSubjectExams(subjectId: item.id!),
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}
