import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import '../../../../../core/helpers/app_snackbar.dart';
import '../../../../../core/helpers/my_responsive.dart';
import '../../../../../core/helpers/validator.dart';
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/values/app_strings.dart';
import '../../manager/login/login_cubit.dart';
import '../../manager/login/login_state.dart';
import '../../widgets/login/auth_navigation_text.dart';
import '../../widgets/login/remember_me_and_forget_widget.dart';

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppStrings.login),
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listenWhen: (prev, curr) =>
        curr is LoginSuccessState || curr is LoginFailureState,
        listener: (context, state) {
          if (state is LoginSuccessState) {
            AppSnackbar.success(context, state.authEntity.message!);
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeRoute,
              (route) => false,
            );
          } else if (state is LoginFailureState) {
            AppSnackbar.error(context, state.errorMessage);
          }
        },
        child: Padding(
          padding: MyResponsive.paddingSymmetric(horizontal: 16, vertical: 24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                /// 🔥 Email
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (prev, curr) =>
                      prev is LoginLoadingState != curr is LoginLoadingState,
                  builder: (context, state) {
                    final cubit = context.read<LoginCubit>();
                    final isLoading = state is LoginLoadingState;

                    return TextFormField(
                      controller: emailController,
                      onChanged: (_) => _validate(cubit),
                      validator: Validator.email,
                      enabled: !isLoading,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: AppStrings.email,
                        hintText: AppStrings.enterYouEmail,
                      ),
                    );
                  },
                ),

                SizedBox(height: MyResponsive.height(value: 24)),

                /// 🔥 Password
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (prev, curr) =>
                      prev is LoginLoadingState != curr is LoginLoadingState,
                  builder: (context, state) {
                    final cubit = context.read<LoginCubit>();
                    final isLoading = state is LoginLoadingState;

                    return TextFormField(
                      controller: passwordController,
                      onChanged: (_) => _validate(cubit),
                      obscureText: true,
                      enabled: !isLoading,
                      validator: Validator.password,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: AppStrings.password,
                        hintText: AppStrings.enterYouPassword,
                      ),
                    );
                  },
                ),

                SizedBox(height: MyResponsive.height(value: 14)),

                /// 🔥 Remember me (مش محتاج state أصلاً)
                RememberMeAndForgetWidget(
                  onChanged: (value) => context
                      .read<LoginCubit>()
                      .changeRememberMe(value ?? false),
                ),

                SizedBox(height: MyResponsive.height(value: 50)),

                /// 🔥 Button (أهم واحد)
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (prev, curr) =>
                      prev.isFormValid != curr.isFormValid ||
                      prev is LoginLoadingState != curr is LoginLoadingState,
                  builder: (context, state) {
                    final cubit = context.read<LoginCubit>();
                    final isLoading = state is LoginLoadingState;

                    return CustomButton(
                      title: AppStrings.login,
                      backgroundColor: state.isFormValid
                          ? AppColors.primaryColor
                          : Colors.grey,
                      onPressed: state.isFormValid
                          ? () => cubit.loginWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      )
                          : null,
                      isLoading: isLoading,
                    );
                  },
                ),

                SizedBox(height: MyResponsive.height(value: 16)),

                /// Sign Up (static)
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
        ),
      ),
    );
  }
}