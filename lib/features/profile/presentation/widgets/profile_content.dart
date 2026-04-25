import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/cache/secure_cache/secure_cache_helper.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/shared_widgets/custom_button.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam/features/profile/presentation/manager/profile_controller.dart';
import 'package:online_exam/features/profile/presentation/manager/update_profile/update_profile_cubit.dart';
import 'package:online_exam/features/profile/presentation/manager/update_profile/update_profile_event.dart';
import 'package:online_exam/features/profile/presentation/widgets/profile_form.dart';
import 'package:online_exam/features/profile/presentation/widgets/profile_picture.dart';
import 'package:online_exam/features/profile/presentation/widgets/update_profile_button.dart';

import '../../../../config/cache/secure_cache/cache_keys.dart';
import 'logout_dialog.dart';

class ProfileContent extends StatefulWidget {
  final ProfileController controller;
  final GlobalKey<FormState> formKey;
  final UserEntity user;

  const ProfileContent({
    super.key,
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

              BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                builder: (context, state) {
                  final isLoading = state is UpdateProfileLoading;

                  return Column(
                    children: [
                      ProfileForm(
                        formKey: widget.formKey,
                        usernameController: controller.username,
                        firstNameController: controller.firstName,
                        lastNameController: controller.lastName,
                        emailController: controller.email,
                        phoneController: controller.phone,
                        isLoading: isLoading,
                      ),

                      SizedBox(height: MyResponsive.height(value: 34)),
                      UpdateProfileButton(
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
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: MyResponsive.height(value: 16)),
              CustomButton(
                title: AppStrings.logOut,
                backgroundColor: AppColors.baseWhite,
                foregroundColor: AppColors.primaryColor,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => LogoutDialog(
                      onLogout: () {
                        SecureCacheHelper.removeData(key: CacheKeys.token);
                        SecureCacheHelper.removeData(key: CacheKeys.rememberMe);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          Routes.loginRoute,
                          (route) => false,
                        );
                      },
                    ),
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
