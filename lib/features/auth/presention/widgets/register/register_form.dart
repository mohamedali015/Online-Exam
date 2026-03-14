import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/helpers/validator.dart';
import 'package:online_exam/core/shared_widgets/custom_text_form_field.dart';
import 'package:online_exam/core/values/app_strings.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.userNameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController userNameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: Column(
        children: [
          CustomTextFormField(
            title: AppStrings.userName,
            controller: userNameController,
            hintText: AppStrings.enterYouUserName,
            myValidator: Validator.name,
          ),
          SizedBox(height: MyResponsive.height(value: 28)),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  title: AppStrings.firstName,
                  controller: firstNameController,
                  hintText: AppStrings.enterFirstName,
                  myValidator: Validator.name,
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: CustomTextFormField(
                  title: AppStrings.lastName,
                  controller: lastNameController,
                  hintText: AppStrings.enterLastName,
                  myValidator: Validator.name,
                ),
              ),
            ],
          ),
          SizedBox(height: MyResponsive.height(value: 28)),

          CustomTextFormField(
            title: AppStrings.email,
            controller: emailController,
            hintText: AppStrings.enterYouEmail,
            myValidator: Validator.email,
          ),

          SizedBox(height: MyResponsive.height(value: 28)),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  title: AppStrings.password,
                  isPassword: true,
                  controller: passwordController,
                  hintText: AppStrings.enterYouPassword,
                  myValidator: Validator.password,
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: CustomTextFormField(
                  title: AppStrings.confirmPassword,
                  isPassword: true,
                  controller: confirmPasswordController,
                  hintText: AppStrings.confirmPassword,
                  myValidator: (value) =>
                      Validator.confirmPassword(value, passwordController.text),
                ),
              ),
            ],
          ),
          SizedBox(height: MyResponsive.height(value: 28)),

          CustomTextFormField(
            title: AppStrings.phoneNumber,
            controller: phoneController,
            hintText: AppStrings.enterPhoneNumber,
            myValidator: Validator.phone,
          ),
        ],
      ),
    );
  }
}
