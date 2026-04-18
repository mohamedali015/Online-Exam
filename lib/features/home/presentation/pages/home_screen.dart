import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/features/home/presentation/manager/all_subjects_cubit.dart';
import 'package:online_exam/features/home/presentation/manager/all_subjects_event.dart';

import '../../../../core/helpers/my_responsive.dart';
import '../../../../core/utils/app_assets.dart';
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

            SearchBar(
              backgroundColor: WidgetStatePropertyAll(
                AppColors.baseWhite,
              ),

              padding: WidgetStatePropertyAll<EdgeInsets>(
                MyResponsive.paddingSymmetric(horizontal: 8),
              ),
              hintText: AppStrings.search,
              leading: Icon(Icons.search, color: AppColors.baseGray),
              controller: searchController,
              onChanged: (value) {
                context.read<SubjectsCubit>().doEvent(
                  GetSearchSubjectsEvent(query: value),
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.noFoundResearch,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          AppStrings.noSubjectsFound,
                          style: AppTextStyles.medium18,
                        ),
                      ],
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

  }

}
