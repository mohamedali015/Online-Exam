import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam/features/profile/presentation/manager/profile_controller.dart';
import 'package:online_exam/features/profile/presentation/manager/update_profile/update_profile_cubit.dart';
import 'package:online_exam/features/profile/presentation/manager/update_profile/update_profile_event.dart';
import 'package:online_exam/features/profile/presentation/widgets/profile_form.dart';
import 'package:online_exam/features/profile/presentation/widgets/profile_picture.dart';
import 'package:online_exam/features/profile/presentation/widgets/update_profile_button.dart';

class ProfileContent extends StatefulWidget {
  final ProfileController controller;
  final GlobalKey<FormState> formKey;
  final UserEntity user;

  const ProfileContent({
    required this.controller,
    required this.formKey,
    required this.user,
  });

  @override
  State<ProfileContent> createState() => ProfileContentState();
}

class ProfileContentState extends State<ProfileContent> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!widget.controller.isInitialized) {
        widget.controller.initializeFromUser(widget.user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: MyResponsive.paddingAll(value: 16),
          child: Column(
            children: [
              const ProfilePicture(),
              SizedBox(height: MyResponsive.height(value: 40)),

              ProfileForm(
                formKey: widget.formKey,
                usernameController: controller.username,
                firstNameController: controller.firstName,
                lastNameController: controller.lastName,
                emailController: controller.email,
                phoneController: controller.phone,
              ),

              SizedBox(height: MyResponsive.height(value: 40)),

              BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                builder: (context, state) {
                  final isLoading = state is UpdateProfileLoading;

                  return UpdateProfileButton(
                    canSubmit: controller.hasChanges,
                    isLoading: isLoading,
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      context.read<UpdateProfileCubit>().doEvents(
                        UpdateProfile(
                          username: controller.username.text,
                          firstname: controller.firstName.text,
                          lastname: controller.lastName.text,
                          email: controller.email.text,
                          phone: controller.phone.text,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
