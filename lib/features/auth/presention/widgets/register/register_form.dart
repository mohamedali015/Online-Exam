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
          TextFormField(
            onChanged: (_) => onChanged(),
            decoration: InputDecoration(
              label: Text(AppStrings.userName),
              hintText: AppStrings.enterYouUserName,
            ),

            controller: userNameController,
            validator: Validator.name,

            keyboardType: TextInputType.name,
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (_) => onChanged(),
                  decoration: InputDecoration(
                    label: Text(AppStrings.firstName),
                    hintText: AppStrings.enterFirstName,
                  ),

                  controller: firstNameController,
                  validator: Validator.name,

                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: TextFormField(
                  onChanged: (_) => onChanged(),
                  decoration: InputDecoration(
                    label: Text(AppStrings.lastName),
                    hintText: AppStrings.enterLastName,
                  ),

                  controller: lastNameController,
                  validator: Validator.name,

                  keyboardType: TextInputType.name,
                ),
              ),
            ],
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          TextFormField(
            onChanged: (_) => onChanged(),
            decoration: InputDecoration(
              label: Text(AppStrings.email),
              hintText: AppStrings.enterYouEmail,
            ),

            controller: emailController,
            validator: Validator.email,

            keyboardType: TextInputType.emailAddress,
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (_) => onChanged(),
                  decoration: InputDecoration(
                    label: Text(AppStrings.password),
                    hintText: AppStrings.enterYouPassword,
                  ),

                  controller: passwordController,
                  validator: Validator.password,

                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: TextFormField(
                  onChanged: (_) => onChanged(),
                  decoration: InputDecoration(
                    label: Text(AppStrings.confirmPassword),
                    hintText: AppStrings.confirmPassword,
                  ),

                  controller: confirmPasswordController,
                  validator: (value) =>
                      Validator.confirmPassword(value, passwordController.text),

                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
            ],
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          TextFormField(
            onChanged: (_) => onChanged(),
            decoration: InputDecoration(
              label: Text(AppStrings.phoneNumber),
              hintText: AppStrings.enterPhoneNumber,
            ),

            controller: phoneController,
            validator: Validator.phone,

            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
