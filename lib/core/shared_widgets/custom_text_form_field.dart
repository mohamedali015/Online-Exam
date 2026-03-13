import 'package:flutter/material.dart';

import '../helpers/validator.dart';
import '../values/app_strings.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.type,
    this.controller,
    this.passController,
    this.obsecure = true,
    this.onSuffixTapped,
    this.onChanged,
  });

  final TextFieldType type;
  final TextEditingController? controller;
  final TextEditingController? passController;
  final bool isFirstName = false;
  final bool obsecure;
  final void Function()? onSuffixTapped;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TextFieldType.password:
        return _passwordField(
          context,
          passController == null
              ? Validator.password
              : (value) =>
              Validator.confirmPassword(value, passController!.text),
        );

      case TextFieldType.email:
        return _emailField(context, Validator.email);

      case TextFieldType.name:
        return _nameField(context, Validator.name);

      case TextFieldType.phone:
        return _phoneField(context, Validator.phone);

      case TextFieldType.userName:
        return _userNameField(context, Validator.name);
    }
  }

  /////////////////////// Decorations //////////////////////
  InputDecoration _inputDecoration(
      BuildContext context, {
        String? label,
        String? hint,
        Widget? suffixIcon,
      }) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      errorMaxLines: 2,
      suffixIcon: suffixIcon,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
  }

  ///////////////////////// TextFields //////////////////////

  Widget _nameField(
      BuildContext context,
      String? Function(String?)? validator,
      ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      decoration: _inputDecoration(
        context,
        label: isFirstName ? AppStrings.firstName : AppStrings.lastName,
        hint:
        isFirstName ? AppStrings.enterFirstName : AppStrings.enterLastName,
      ),
    );
  }

  Widget _userNameField(
      BuildContext context,
      String? Function(String?)? validator,
      ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      decoration: _inputDecoration(
        context,
        label: AppStrings.userName,
        hint: AppStrings.enterYouUserName,
      ),
    );
  }

  Widget _emailField(
      BuildContext context,
      String? Function(String?)? validator,
      ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      decoration: _inputDecoration(
        context,
        label: AppStrings.email,
        hint: AppStrings.enterYouEmail,
      ),
    );
  }

  Widget _passwordField(
      BuildContext context,
      String? Function(String?)? validator,
      ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: obsecure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      decoration: _inputDecoration(
        context,
        label: passController == null
            ? AppStrings.password
            : AppStrings.confirmPassword,
        hint: AppStrings.enterYouPassword,
      ),
    );
  }

  Widget _phoneField(
      BuildContext context,
      String? Function(String?)? validator,
      ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      decoration: _inputDecoration(
        context,
        label: AppStrings.phoneNumber,
        hint: AppStrings.enterPhoneNumber,
      ),
    );
  }
}

enum TextFieldType { password, email, name, phone, userName }