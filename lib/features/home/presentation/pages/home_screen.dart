import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/features/home/presentation/manager/all_subjects_cubit.dart';
import 'package:online_exam/features/home/presentation/manager/all_subjects_event.dart';
import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/values/app_strings.dart';
import '../manager/all_subjects_state.dart';
import '../widgets/custom_subject_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SubjectsCubit>()..doEvent(GetAllSubjectsEvent()),

      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppStrings.survey,
                style: AppTextStyles.medium20.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              automaticallyImplyLeading: false,
            ),

            body: Padding(
              padding: MyResponsive.paddingSymmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: MyResponsive.height(value: 16)),

                  CustomTextFormField(
                    controller: searchController,
                    type: TextFieldType.search,
                    searchOnChange: (value) {
                      context.read<SubjectsCubit>().doEvent(
                          GetSearchSubjectsEvent(query: value)
                      );
                    },
                  ),

                  SizedBox(height: MyResponsive.height(value: 20)),

                  Expanded(
                    child: BlocBuilder<SubjectsCubit, SubjectsState>(
                      builder: (context, state) {
                        if (state.isLoading == true) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state.errorMessage != null) {
                          return Center(child: Text(state.errorMessage!));
                        }

                        if (state.subjects.isEmpty) {
                          return const Center(
                            child: Text(AppStrings.noSubjectsFound),
                          );
                        }

                        return ListView.builder(
                          itemCount: state.subjects.length,
                          itemBuilder: (context, index) {
                            final subject = state.subjects[index];
                            return SubjectCard(item: subject);
                          },
                        );
                      },

                      buildWhen: (prev, curr) =>
                          prev.subjects != curr.subjects ||
                          prev.isLoading != curr.isLoading ||
                          prev.errorMessage != curr.errorMessage,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
