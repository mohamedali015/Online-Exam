import 'package:flutter/material.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/shared_widgets/custom_error_widget.dart';
import 'package:online_exam/core/shared_widgets/custom_loading_indicator.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/features/results/presentation/widgets/result_exam_card.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/values/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/results/presentation/manager/results_cubit.dart';
import 'package:online_exam/features/results/presentation/manager/results_state.dart';

import '../manager/results_events.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.result)),

      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ResultsCubit>().doEvent(GetResults());
        },
        child: Padding(
          padding: MyResponsive.paddingSymmetric(horizontal: 16),
          child: BlocBuilder<ResultsCubit, ResultsState>(
            builder: (context, state) {
              final resultsState = state.resultsState;

              if (resultsState.isLoading) {
                return const CustomLoadingIndicator();
              } else if (resultsState.errorMessage != null &&
                  resultsState.errorMessage!.isNotEmpty) {
                return CustomErrorWidget(
                  errorMessage: resultsState.errorMessage!,
                  haveTryAgain: true,
                  onPressed: () {
                    context.read<ResultsCubit>().doEvent(GetResults());
                  },
                );
              } else if (resultsState.data != null &&
                  resultsState.data!.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: double.infinity),
                    Image.asset(
                      AppAssets.noFoundResearch,
                      fit: BoxFit.contain,
                      height: MyResponsive.height(value: 200),
                    ),
                    Text(AppStrings.noResults, style: AppTextStyles.medium18),
                  ],
                );
              } else if (resultsState.data != null &&
                  resultsState.data!.isNotEmpty) {
                final grouped = resultsState.data!;
                final subjects = grouped.keys.toList();

                return ListView.builder(
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    final subject = subjects[index];
                    final exams = grouped[subject]!;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MyResponsive.height(value: 20)),

                        Text(subject, style: AppTextStyles.medium18),

                        SizedBox(height: MyResponsive.height(value: 24)),

                        ...exams.map(
                          (exam) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.resultDetailsRoute,
                                arguments: exam,
                              );
                            },
                            child: ResultExamCard(exam: exam),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
