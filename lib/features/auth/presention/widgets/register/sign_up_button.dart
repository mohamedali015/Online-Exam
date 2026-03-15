import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_cubit.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_events.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.formKey,
    required this.registerCubit,
    required this.isButtonEnabled,
    this.isLoading = false,
  });

  final GlobalKey<FormState> formKey;
  final RegisterCubit registerCubit;
  final bool isButtonEnabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (!isButtonEnabled || isLoading)
            ? null
            : () {
                if (formKey.currentState!.validate()) {
                  registerCubit.doEvents(
                    RegisterSubmitted(
                      userName: registerCubit.userNameController.text,
                      firstName: registerCubit.firstNameController.text,
                      lastName: registerCubit.lastNameController.text,
                      email: registerCubit.emailController.text,
                      password: registerCubit.passwordController.text,
                      confirmPassword:
                          registerCubit.confirmPasswordController.text,
                      phone: registerCubit.phoneController.text,
                    ),
                  );
                } else {
                  registerCubit.doEvents(
                    RegisterValidateForm(markSubmitted: true),
                  );
                }
              },
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
