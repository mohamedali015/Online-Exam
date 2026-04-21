import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/user/manager/user_cubit.dart';
import 'package:online_exam/config/user/manager/user_events.dart';
import 'package:online_exam/config/user/manager/user_state.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/profile/presentation/manager/profile_controller.dart';
import 'package:online_exam/features/profile/presentation/manager/update_profile/update_profile_cubit.dart';
import 'package:online_exam/features/profile/presentation/widgets/profile_form.dart';
import 'package:online_exam/features/profile/presentation/widgets/profile_picture.dart';
import 'package:online_exam/features/profile/presentation/widgets/update_button.dart';

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

    Future.microtask(() {
      context.read<UserCubit>().doEvent(GetUserData());
    });
  }

  void _addListeners() {
    controller.username.addListener(_onChange);
    controller.firstName.addListener(_onChange);
    controller.lastName.addListener(_onChange);
    controller.email.addListener(_onChange);
    controller.phone.addListener(_onChange);
  }

  void _onChange() {
    setState(() {
      controller.checkChanges();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileSuccess) {
              controller.fillFromUser(state.updateProfileEntity);
              setState(() {});
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.profile),
          automaticallyImplyLeading: false,
        ),
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is GetUserDataSuccessState) {
              controller.fillFromUser(state.user);
              setState(() {});
            }
          },
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const ProfilePicture(),
                      const SizedBox(height: 40),

                      ProfileForm(
                        formKey: _formKey,
                        usernameController: controller.username,
                        firstNameController: controller.firstName,
                        lastNameController: controller.lastName,
                        emailController: controller.email,
                        phoneController: controller.phone,
                      ),

                      const SizedBox(height: 40),

                      BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                        builder: (context, state) {
                          final loading = state is UpdateProfileLoading;

                          return UpdateButton(
                            usernameController: controller.username,
                            firstNameController: controller.firstName,
                            lastNameController: controller.lastName,
                            emailController: controller.email,
                            phoneController: controller.phone,
                            isEnabled: controller.isChanged && !loading,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
