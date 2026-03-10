import 'package:flutter/material.dart';

import '../helpers/validator.dart';
import '../utils/app_colors.dart';
import '../values/app_strings.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.type,
    this.controller,
    this.passController,
    this.obsecure = true,
    this.onSuffixTapped,
  });

  final TextFieldType type;
  final TextEditingController? controller;
  final TextEditingController? passController;
  final bool isFirstName = false;
  final bool obsecure;
  final void Function()? onSuffixTapped;

  // final void Function(String)? searchOnChange;

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

  ///////////////////////--Decorations//////////////////////
  InputDecoration _inputDecoration(
    BuildContext context, {
    String? label,
    String? hint,
    Widget? suffixIcon,
    // Widget? prefixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      // hintStyle: AppTextStyles.regular14.copyWith(
      //   color: AppColors.hintTextGray,
      // ),
      labelText: label,
      // labelStyle: AppTextStyles.regular12.copyWith(color: AppColors.baseGray),
      errorMaxLines: 2,
      // contentPadding: MyResponsive.paddingSymmetric(
      //   horizontal: 13,
      //   vertical: 20,
      // ),
      // prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    );
  }

  /////////////////////////--TextFields////////////////////////////////
  Widget _nameField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      // style: _textStyle(context),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      decoration: _inputDecoration(
        context,
        label: isFirstName ? AppStrings.firstName : AppStrings.lastName,
        hint: isFirstName
            ? AppStrings.enterFirstName
            : AppStrings.enterLastName,
      ),
    );
  }

  Widget _userNameField(
    BuildContext context,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      // style: _textStyle(context),
      validator: validator,
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
      // style: _textStyle(context),
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
      // style: _textStyle(context),
      obscureText: obsecure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      decoration: _inputDecoration(
        context,
        label: passController == null
            ? AppStrings.password
            : AppStrings.confirmPassword,

        hint: passController == null
            ? AppStrings.enterYouPassword
            : AppStrings.enterYouPassword,

        // suffixIcon: IconButton(
        //   onPressed: onSuffixTapped,
        //   icon: obsecure
        //       ? Icon(Icons.visibility, color: AppColors.baseGray)
        //       : Icon(Icons.visibility_off, color: AppColors.baseGray),
        // ),
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      decoration: _inputDecoration(
        context,
        label: AppStrings.phoneNumber,
        hint: AppStrings.enterPhoneNumber,
      ),
    );
  }

  // Widget _searchField(
  //   BuildContext context,
  // ) {
  //   return SearchBar(
  //     hintText: AppStrings.search,
  //     leading: Icon(Icons.search, color: AppColors.gray),
  //     backgroundColor: WidgetStateProperty.all(AppColors.appFill),
  //     shape: WidgetStateProperty.all(
  //       RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(MyResponsive.radius(value: 10)),
  //         side: BorderSide(
  //           color: AppColors.white.withValues(alpha: .1),
  //           width: 1.2,
  //         ),
  //       ),
  //     ),
  //     textStyle: WidgetStateProperty.all(
  //       const TextStyle(
  //         color: Colors.white,
  //         fontSize: 16,
  //       ),
  //     ),
  //     hintStyle: WidgetStateProperty.all(
  //       AppTextStyles.semiBold17.copyWith(color: AppColors.gray),
  //     ),
  //     padding: WidgetStateProperty.all(
  //       MyResponsive.paddingSymmetric(
  //         horizontal: 19,
  //         vertical: 10,
  //       ),
  //     ),
  //     // elevation: WidgetStateProperty.all(0),
  //
  //     onChanged: searchOnChange,
  //   );
  // }
}

enum TextFieldType { password, email, name, phone, userName }
