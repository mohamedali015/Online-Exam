import 'package:flutter/material.dart';

import '../helpers/my_responsive.dart';
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
    this.onChanged,
    this.isLoading = false, this.searchOnChange,
  });

  final TextFieldType type;
  final TextEditingController? controller;
  final TextEditingController? passController;
  final bool isFirstName = false;
  final bool obsecure;
  final void Function()? onSuffixTapped;
  final void Function(String)? onChanged;
  final bool isLoading;

  final void Function(String)? searchOnChange;

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
      case TextFieldType.search:
       return _searchField(context);
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
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      enabled: isLoading ? false : true,
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
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      enabled: isLoading ? false : true,
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
      // style: _textStyle(context),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      enabled: isLoading ? false : true,
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
      // style: _textStyle(context),
      obscureText: obsecure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      enabled: isLoading ? false : true,
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
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      enabled: isLoading ? false : true,
      decoration: _inputDecoration(
        context,
        label: AppStrings.phoneNumber,
        hint: AppStrings.enterPhoneNumber,
      ),
    );
  }

Widget _searchField(
  BuildContext context,
) {
  return SearchBar(
    hintText: AppStrings.search,
    leading: Icon(Icons.search, color: AppColors.baseGray),
    backgroundColor: WidgetStateProperty.all(AppColors.baseWhite),
    elevation: WidgetStateProperty.all(0),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MyResponsive.radius(value: 20)),
        side: BorderSide(
          color: AppColors.baseGray,
          width: 1.2,
        ),
      ),
    ),
    // textStyle: WidgetStateProperty.all(
    //   const TextStyle(
    //     color: Colors.white,
    //     fontSize: 16,
    //   ),
    // ),
    // hintStyle: WidgetStateProperty.all(
    //   AppTextStyles.semiBold12.copyWith(color: AppColors.baseGray),
    // ),

    padding: WidgetStateProperty.all(
      MyResponsive.paddingSymmetric(horizontal: 18, vertical: 4),
    ),
    // elevation: WidgetStateProperty.all(8),
    onChanged: searchOnChange,

  );
}
}

enum TextFieldType { password, email, name, phone, userName,search }