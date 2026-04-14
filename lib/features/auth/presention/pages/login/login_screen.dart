import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _validate(LoginCubit cubit) {
    final isValid = formKey.currentState?.validate() ?? false;
    cubit.validateForm(isValid);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppStrings.login,
          style: AppTextStyles.medium20.copyWith(color: AppColors.baseBlack),
        ),
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listenWhen: (prev, curr) =>
        curr is LoginSuccessState || curr is LoginFailureState,
        listener: (context, state) {
          if (state is LoginSuccessState) {
            AppSnackbar.success(context, state.authEntity.message!);
            Navigator.pushReplacementNamed(context, Routes.homeRoute);
          } else if (state is LoginFailureState) {
            AppSnackbar.error(context, state.errorMessage);
          }
        },
        child: Padding(
          padding:
          MyResponsive.paddingSymmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                /// Email
                CustomTextFormField(
                  controller: emailController,
                  type: TextFieldType.email,
                  onChanged: (_) => _validate(cubit),
                ),

                SizedBox(height: MyResponsive.height(value: 24)),

                /// Password
                CustomTextFormField(
                  controller: passwordController,
                  type: TextFieldType.password,
                  onChanged: (_) => _validate(cubit),
                isLoading: state is LoginLoadingState,
                    ),

                SizedBox(height: MyResponsive.height(value: 14)),

                /// Remember Me
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return RememberMeAndForgetWidget(
                      onChanged: (value) =>
                          cubit.changeRememberMe(value ?? false),
                    );
                  },
                ),

                SizedBox(height: MyResponsive.height(value: 50)),

                /// Button
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (prev, curr) =>
                  prev.isFormValid != curr.isFormValid,
                  builder: (context, state) {
                    return CustomButton(
                      title: AppStrings.login,
                      // backgroundColor: state.isFormValid
                      //     ? AppColors.primaryColor
                      //     : Colors.grey,
                      onPressed: state.isFormValid
                          ? () => cubit.loginWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      )
                          : null,
                      isLoading: state is LoginLoadingState,
                    );
                  },
                ),

                SizedBox(height: MyResponsive.height(value: 16)),

                /// Sign Up
                AuthNavigationText(
                  title: "${AppStrings.doNotHaveAnAccount}?",
                  actionText: AppStrings.signUp,
                  onTap: () {
                Navigator.pushNamed(context, Routes.registerRoute);
                      },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}