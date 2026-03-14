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
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<LoginCubit>(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            AppStrings.login,
            style: AppTextStyles.medium20.copyWith(
              color: AppColors.baseBlack,
            ),
          ),
        ),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            switch (state) {
              case LoginSuccessState():
                {
                  AppSnackbar.success(context, state.authEntity.message!);
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.homeRoute,
                  );
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
                    ),

                    SizedBox(height: MyResponsive.height(value: 24)),

                    /// Password
                    CustomTextFormField(
                      controller: cubit.passwordController,
                      type: TextFieldType.password,
                      onChanged: (_) => cubit.validateForm(),
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
                      backgroundColor: state.isFormValid
                          ? AppColors.primaryColor
                          : Colors.grey,
                      onPressed: state.isFormValid
                          ? () {
                        cubit.loginWithEmailAndPassword();
                      }
                          : null,
                    ),

                    SizedBox(height: MyResponsive.height(value: 16)),

                    /// Sign Up
                    AuthNavigationText(
                      title: "${AppStrings.doNotHaveAnAccount}?",
                      actionText: AppStrings.signUp,
                      onTap: () {},
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
