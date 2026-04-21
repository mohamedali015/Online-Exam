import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/profile/presentation/manager/update_profile/update_profile_cubit.dart';
import 'package:online_exam/features/profile/presentation/manager/update_profile/update_profile_event.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    super.key,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.isEnabled,
  });

  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        final isLoading = state is UpdateProfileLoading;

        return ElevatedButton(
          onPressed: isEnabled && !isLoading
              ? () {
                  FocusScope.of(context).unfocus();
                  context.read<UpdateProfileCubit>().doEvents(
                    UpdateProfile(
                      username: usernameController.text,
                      firstname: firstNameController.text,
                      lastname: lastNameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                    ),
                  );
                }
              : null,
          child: isLoading
              ? SizedBox(
                  height: MyResponsive.height(value: 22),
                  width: MyResponsive.width(value: 22),
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.baseWhite,
                  ),
                )
              : const Text(AppStrings.update),
        );
      },
    );
  }
}
