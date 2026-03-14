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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterCubit registerCubit = getIt.get<RegisterCubit>();

  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    userNameController.addListener(_onFormChanged);
    firstNameController.addListener(_onFormChanged);
    lastNameController.addListener(_onFormChanged);
    emailController.addListener(_onFormChanged);
    passwordController.addListener(_onFormChanged);
    confirmPasswordController.addListener(_onFormChanged);
    phoneController.addListener(_onFormChanged);
  }

  void _onFormChanged() {
    registerCubit.doEvents(
      RegisterFormChanged(
        userName: userNameController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        phone: phoneController.text,
      ),
    );
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
    return BlocProvider(
      create: (_) => registerCubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.signUp),
          leadingWidth: MyResponsive.width(value: 15),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: MyResponsive.paddingSymmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                RegisterForm(
                  formKey: _formKey,
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
                      userName: userNameController.text,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                      phone: phoneController.text,
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
                            Navigator.pushReplacementNamed(context, Routes.loginRoute);
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
