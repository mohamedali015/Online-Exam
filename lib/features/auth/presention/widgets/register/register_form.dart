import 'package:flutter/material.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/helpers/validator.dart';
import 'package:online_exam/core/values/app_strings.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.autoValidate,
    required this.onChanged,
    required this.userNameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
  });

  final GlobalKey<FormState> formKey;
  final bool autoValidate;
  final VoidCallback onChanged;

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
      key: formKey,
      autovalidateMode: autoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: Column(
        children: [
          _field(
            controller: userNameController,
            validator: Validator.name,
            label: AppStrings.userName,
            hint: AppStrings.enterYouUserName,
            type: TextInputType.name,
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          Row(
            children: [
              Expanded(
                child: _field(
                  controller: firstNameController,
                  validator: Validator.name,
                  label: AppStrings.firstName,
                  hint: AppStrings.enterFirstName,
                  type: TextInputType.name,
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: _field(
                  controller: lastNameController,
                  validator: Validator.name,
                  label: AppStrings.lastName,
                  hint: AppStrings.enterLastName,
                  type: TextInputType.name,
                ),
              ),
            ],
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          _field(
            controller: emailController,
            validator: Validator.email,
            label: AppStrings.email,
            hint: AppStrings.enterYouEmail,
            type: TextInputType.emailAddress,
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          Row(
            children: [
              Expanded(
                child: _field(
                  controller: passwordController,
                  validator: Validator.password,
                  label: AppStrings.password,
                  hint: AppStrings.enterYouPassword,
                  type: TextInputType.visiblePassword,
                  isPassword: true,
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: _field(
                  controller: confirmPasswordController,
                  validator: (value) =>
                      Validator.confirmPassword(value, passwordController.text),
                  label: AppStrings.confirmPassword,
                  hint: AppStrings.confirmPassword,
                  type: TextInputType.visiblePassword,
                  isPassword: true,
                ),
              ),
            ],
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          _field(
            controller: phoneController,
            validator: Validator.phone,
            label: AppStrings.phoneNumber,
            hint: AppStrings.enterPhoneNumber,
            type: TextInputType.phone,
          ),
        ],
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String? Function(String?) validator,
    required String label,
    required String hint,
    required TextInputType type,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: type,
      obscureText: isPassword,
      onChanged: (_) => onChanged(), // 🔥 مهم جدًا
      decoration: InputDecoration(label: Text(label), hintText: hint),
    );
  }
}
