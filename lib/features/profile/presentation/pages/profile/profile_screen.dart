import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/user/manager/user_cubit.dart';
import 'package:online_exam/config/user/manager/user_events.dart';
import 'package:online_exam/config/user/manager/user_state.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
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
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          controller.fillFromUser(state.updateProfile);

          context.read<UserCubit>().doEvent(
            SetUserData(user: state.updateProfile),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.profile),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            /// Loading
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!controller.isInitialized) {
              controller.isInitialized = true;

              WidgetsBinding.instance.addPostFrameCallback((_) {
                controller.fillFromUser(state.user!);
              });
            }

            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: MyResponsive.paddingAll(value: 16),
                  child: Column(
                    children: [
                      const ProfilePicture(),
                      SizedBox(height: MyResponsive.height(value: 40)),

                      ProfileForm(
                        formKey: _formKey,
                        usernameController: controller.username,
                        firstNameController: controller.firstName,
                        lastNameController: controller.lastName,
                        emailController: controller.email,
                        phoneController: controller.phone,
                      ),

                      SizedBox(height: MyResponsive.height(value: 40)),

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
