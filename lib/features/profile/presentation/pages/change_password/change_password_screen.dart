import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/app_snackbar.dart';
import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/helpers/validator.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/values/app_strings.dart';
import '../../manager/change_password_cubit/change_password_cubit.dart';
import '../../manager/change_password_cubit/change_password_event.dart';
import '../../manager/change_password_cubit/change_password_state.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final oldPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    oldPasswordController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(AppStrings.changePassword),
      ),

      body: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state.isSuccess) {
            AppSnackbar.success(
              context,
              AppStrings.passwordChangedSuccessfully,
            );
            Navigator.pop(context);
          }

          if (state.errorMessage != null) {
            AppSnackbar.error(context, state.errorMessage!);
          }
        },

        builder: (context, state) {
          return Padding(
            padding: MyResponsive.paddingSymmetric(
              horizontal: 16,
              vertical: 24,
            ),

            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: oldPasswordController,
                    obscureText: true,
                    enabled: !state.isLoading,
                    validator: Validator.password,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: AppStrings.currentPassword,
                      hintText: AppStrings.currentPassword,
                    ),
                  ),

                  SizedBox(height: MyResponsive.height(value: 14)),

                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    enabled: !state.isLoading,
                    validator: Validator.password,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: AppStrings.newPassword,
                      hintText: AppStrings.newPassword,
                    ),
                  ),

                  SizedBox(height: MyResponsive.height(value: 14)),

                  TextFormField(
                    controller: rePasswordController,
                    obscureText: true,
                    enabled: !state.isLoading,
                    validator: (value) => Validator.confirmPassword(
                      value,
                      passwordController.text,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: AppStrings.confirmPassword,
                      hintText: AppStrings.confirmPassword,
                    ),
                  ),

                  SizedBox(height: MyResponsive.height(value: 40)),

                  CustomButton(
                    title: AppStrings.update,
                    isLoading: state.isLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (oldPasswordController.text.trim() ==
                            passwordController.text.trim()) {
                          AppSnackbar.error(
                              context, AppStrings.oldAndNewPasswordSame);
                          return;
                        } else {
                          context.read<ChangePasswordCubit>().doEvent(
                            SubmitChangePasswordEvent(
                              oldPassword: oldPasswordController.text,
                              newPassword: passwordController.text,
                              rePassword: rePasswordController.text,
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
