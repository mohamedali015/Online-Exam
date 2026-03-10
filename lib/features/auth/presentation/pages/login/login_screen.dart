import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:online_exam/features/auth/presentation/manager/login/login_state.dart';
import '../../../../../core/helpers/app_snackbar.dart';
import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../../core/values/app_strings.dart';
import '../../widgets/auth_navigation_text.dart';
import '../../widgets/remember_me_and_forget_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController(
    text: "fopob28788@feriwor.com",
  );

  final TextEditingController passwordController = TextEditingController(
    text: "Elevate@123",
  );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LoginCubit>(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            AppStrings.login,
            style: AppTextStyles.medium20.copyWith(color: AppColors.baseBlack),
          ),
        ),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            switch (state) {
              case LoginSuccessState():
                {
                  AppSnackbar.success(context, state.authEntity.message!);
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                }

              case LoginFailureState():
                {
                  AppSnackbar.error(context, state.errorMessage);
                }

              default:
            }
          },
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();

            return Padding(
              padding: MyResponsive.paddingSymmetric(
                horizontal: 16,
                vertical: 24,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    /// Email
                    CustomTextFormField(
                      controller: emailController,
                      type: TextFieldType.email,
                    ),

                    SizedBox(height: MyResponsive.height(value: 24)),

                    /// Password
                    CustomTextFormField(
                      controller: passwordController,
                      type: TextFieldType.password,
                    ),

                    SizedBox(height: MyResponsive.height(value: 14)),

                    /// Remember Me
                    RememberMeAndForgetWidget(
                      onChanged: (value) {
                        cubit.changeRememberMe(value ?? false);
                      },
                    ),

                    SizedBox(height: MyResponsive.height(value: 50)),

                    /// Login Button
                     CustomButton(
                            title: AppStrings.login,
                            backgroundColor: AppColors.primaryColor,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.loginWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              }
                            },
                          ),

                    SizedBox(height: MyResponsive.height(value: 16)),

                    /// Sign Up
                    AuthNavigationText(
                      title: "${AppStrings.doNotHaveAnAccount}?",
                      actionText: AppStrings.signUp,
                      onTap: () {
                        // Navigator.pushNamed(context, Routes.register);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
