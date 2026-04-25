import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/user/manager/user_cubit.dart';
import 'package:online_exam/config/user/manager/user_events.dart';
import 'package:online_exam/config/user/manager/user_state.dart';
import 'package:online_exam/core/shared_widgets/custom_error_widget.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/profile/presentation/manager/profile_controller.dart';
import 'package:online_exam/features/profile/presentation/manager/update_profile/update_profile_cubit.dart';
import 'package:online_exam/features/profile/presentation/widgets/profile_content.dart';

import '../../../../../core/shared_widgets/custom_loading_indicator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = ProfileController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _addListeners();
  }

  void _addListeners() {
    controller.username.addListener(_onChange);
    controller.firstName.addListener(_onChange);
    controller.lastName.addListener(_onChange);
    controller.email.addListener(_onChange);
    controller.phone.addListener(_onChange);
  }

  void _onChange() {
    if (!mounted || !controller.isInitialized) return;

    setState(() {
      controller.updateChangeStatus();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          controller.initializeFromUser(state.updateProfile);

          context.read<UserCubit>().doEvent(
            SetUserDataEvent(user: state.updateProfile),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.profile),
          automaticallyImplyLeading: false,
        ),

        body: RefreshIndicator(
          onRefresh: () async {
            final user = context.read<UserCubit>().state.user;

            if (user != null) {
              controller.initializeFromUser(user, force: true);
              setState(() {});
            }
          },
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const CustomLoadingIndicator();
              }

              if (state.user == null) {
                return CustomErrorWidget(errorMessage: AppStrings.noUserData);
              }

              return ProfileContent(
                controller: controller,
                formKey: _formKey,
                user: state.user!,
              );
            },
          ),
        ),
      ),
    );
  }
}
