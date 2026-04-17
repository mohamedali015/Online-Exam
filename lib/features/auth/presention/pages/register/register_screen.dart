import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/config/di/di.dart';
import 'package:online_exam/core/helpers/app_snackbar.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_cubit.dart';
import 'package:online_exam/features/auth/presention/manager/register/register_state.dart';
import 'package:online_exam/features/auth/presention/widgets/register/register_form.dart';
import 'package:online_exam/features/auth/presention/widgets/register/sign_up_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterCubit>(),
      child: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  final _formKey = GlobalKey<FormState>();

  bool autoValidate = false;
  bool isFormValid = false;
  bool hasSubmitted = false;

  late TextEditingController userNameController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
  }

  void _validateForm() {
    if (!autoValidate) return;

    final valid = _formKey.currentState?.validate() ?? false;

    setState(() {
      isFormValid = valid;
    });
  }

  void _onFirstSubmitFailed() {
    setState(() {
      autoValidate = true;
      hasSubmitted = true;
    });
    _validateForm();
  }

  @override
  void dispose() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                autoValidate: autoValidate,
                onChanged: _validateForm,
                userNameController: userNameController,
                firstNameController: firstNameController,
                lastNameController: lastNameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                phoneController: phoneController,
              ),

              SizedBox(height: MyResponsive.height(value: 40)),

              BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  switch (state) {
                    case RegisterSuccess():
                      Navigator.pop(context);
                      break;

                    case RegisterFailure():
                      AppSnackbar.error(context, state.errorMessage);
                      break;

                    default:
                      break;
                  }
                },
                builder: (context, state) {
                  final isLoading = state is RegisterLoading;

                  return SignUpButton(
                    formKey: _formKey,
                    isLoading: isLoading,
                    isFormValid: isFormValid,
                    hasSubmitted: hasSubmitted,
                    onFirstSubmitFailed: _onFirstSubmitFailed,
                    userNameController: userNameController,
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    phoneController: phoneController,
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
                          Navigator.pop(context);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
