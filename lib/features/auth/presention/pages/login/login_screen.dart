import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import '../../../../../core/helpers/app_snackbar.dart';
import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../presention/widgets/login/auth_navigation_text.dart';
import '../../../presention/widgets/login/remember_me_and_forget_widget.dart';
import '../../manager/login/login_cubit.dart';
import '../../manager/login/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LoginCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.login),
          leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
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
                key: cubit.formKey,
                child: Column(
                  children: [
                    /// Email
                    CustomTextFormField(
                      controller: cubit.emailController,
                      type: TextFieldType.email,
                      onChanged: (_) => cubit.validateForm(),
                      isLoading: state is LoginLoadingState,
                    ),

                    SizedBox(height: MyResponsive.height(value: 24)),

                    /// Password
                    CustomTextFormField(
                      controller: cubit.passwordController,
                      type: TextFieldType.password,
                      onChanged: (_) => cubit.validateForm(),
                      isLoading: state is LoginLoadingState,
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
                      // backgroundColor: state.isFormValid
                      //     ? AppColors.primaryColor
                      //     : Colors.grey,
                      onPressed: state.isFormValid
                          ? () {
                              cubit.loginWithEmailAndPassword();
                            }
                          : null,
                      isLoading: state is LoginLoadingState,
                    ),

                    SizedBox(height: MyResponsive.height(value: 16)),

                    /// Sign Up
                    AuthNavigationText(
                      title: "${AppStrings.doNotHaveAnAccount}?",
                      actionText: AppStrings.signUp,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.registerRoute);
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
