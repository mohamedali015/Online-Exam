import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/core/helpers/app_snackbar.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_cubit.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_events.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_state.dart';
import 'package:online_exam/features/auth/presention/widgets/register/sign_up_button.dart';
import 'package:online_exam/features/auth/presention/widgets/register/register_form.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterCubit registerCubit = getIt.get<RegisterCubit>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => registerCubit..doEvents(RegisterInitControllers()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.signUp),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: MyResponsive.paddingSymmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                RegisterForm(
                  formKey: _formKey,
                  userNameController: registerCubit.userNameController,
                  firstNameController: registerCubit.firstNameController,
                  lastNameController: registerCubit.lastNameController,
                  emailController: registerCubit.emailController,
                  passwordController: registerCubit.passwordController,
                  confirmPasswordController:
                      registerCubit.confirmPasswordController,
                  phoneController: registerCubit.phoneController,
                ),
                SizedBox(height: MyResponsive.height(value: 40)),

                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      Navigator.pushReplacementNamed(context, Routes.homeRoute);
                    }

                    if (state is RegisterFailure) {
                      AppSnackbar.error(context, state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    bool isEnabled = false;

                    if (state is RegisterFormState) {
                      isEnabled = state.isButtonEnabled;
                    }

                    return SignUpButton(
                      formKey: _formKey,
                      registerCubit: registerCubit,
                      isLoading: state is RegisterLoading,
                      isButtonEnabled: isEnabled,
                      onInvalid: () {},
                      userName: registerCubit.userNameController.text,
                      firstName: registerCubit.firstNameController.text,
                      lastName: registerCubit.lastNameController.text,
                      email: registerCubit.emailController.text,
                      password: registerCubit.passwordController.text,
                      confirmPassword:
                          registerCubit.confirmPasswordController.text,
                      phone: registerCubit.phoneController.text,
                    );
                  },
                ),

                SizedBox(height: MyResponsive.height(value: 28)),

                RichText(
                  text: TextSpan(
                    text: AppStrings.alreadyHaveAnAccount,
                    style: AppTextStyles.regular16.copyWith(
                      color: AppColors.baseBlack,
                    ),
                    children: [
                      TextSpan(
                        text: " ${AppStrings.login}",
                        style: AppTextStyles.regular16.copyWith(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.loginRoute,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
