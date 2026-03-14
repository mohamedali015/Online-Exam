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
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.isButtonEnabled,
    this.isLoading = false,
    required this.onInvalid,
  });

  final GlobalKey<FormState> formKey;
  final RegisterCubit registerCubit;

  final bool isLoading;
  final bool isButtonEnabled;

  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;

  final VoidCallback onInvalid;

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
                      userName: userName,
                      firstName: firstName,
                      lastName: lastName,
                      email: email,
                      password: password,
                      confirmPassword: confirmPassword,
                      phone: phone,
                    ),
                  );
                } else {
                  onInvalid();
                }
              },
        child: isLoading
            ? SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.baseWhite,
                ),
              )
            : Text(AppStrings.signUp),
      ),
    );
  }
}
