import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_cubit.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_events.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.formKey,
    required this.isFormValid,
    required this.hasSubmitted,
    required this.onFirstSubmitFailed,
    required this.userNameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    this.isLoading = false,
  });

  final GlobalKey<FormState> formKey;
  final bool isFormValid;
  final bool hasSubmitted;
  final VoidCallback onFirstSubmitFailed;
  final bool isLoading;

  final TextEditingController userNameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : (!hasSubmitted || isFormValid)
            ? () {
                if (!formKey.currentState!.validate()) {
                  onFirstSubmitFailed();
                  return;
                }

                cubit.doEvents(
                  RegisterSubmitted(
                    userName: userNameController.text.trim(),
                    firstName: firstNameController.text.trim(),
                    lastName: lastNameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    confirmPassword: confirmPasswordController.text.trim(),
                    phone: phoneController.text.trim(),
                  ),
                );
              }
            : null,
        child: isLoading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.baseWhite,
                ),
              )
            : const Text(AppStrings.signUp),
      ),
    );
  }
}
