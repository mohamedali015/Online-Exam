import 'package:flutter/material.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/helpers/validator.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/core/values/app_strings.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController usernameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            controller: usernameController,
            enabled: !isLoading,
            decoration: InputDecoration(
              label: Text(AppStrings.userName),
              hintText: AppStrings.enterYouUserName,
            ),
            validator: Validator.name,
            keyboardType: TextInputType.name,
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstNameController,
                  enabled: !isLoading,
                  decoration: InputDecoration(
                    label: Text(AppStrings.firstName),
                    hintText: AppStrings.enterFirstName,
                  ),
                  validator: Validator.name,
                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: TextFormField(
                  controller: lastNameController,
                  enabled: !isLoading,
                  decoration: InputDecoration(
                    label: Text(AppStrings.lastName),
                    hintText: AppStrings.enterLastName,
                  ),
                  validator: Validator.name,
                  keyboardType: TextInputType.name,
                ),
              ),
            ],
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          TextFormField(
            controller: emailController,
            enabled: !isLoading,
            decoration: InputDecoration(
              label: Text(AppStrings.email),
              hintText: AppStrings.enterYouEmail,
            ),
            validator: Validator.email,
            keyboardType: TextInputType.emailAddress,
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          TextFormField(
            initialValue: AppStrings.password,
            readOnly: true,
            decoration: InputDecoration(
              suffix: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.changePasswordRoute);
                },
                child: Text(
                  AppStrings.change,
                  style: AppTextStyles.semiBold12().copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              label: Text(AppStrings.password),
            ),
            obscureText: true,
            style: AppTextStyles.regular16().copyWith(
              color: AppColors.passwordGray,
            ),
            obscuringCharacter: AppStrings.obscuringCharacter,
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          TextFormField(
            controller: phoneController,
            enabled: !isLoading,
            decoration: InputDecoration(
              label: Text(AppStrings.phoneNumber),
              hintText: AppStrings.enterPhoneNumber,
            ),
            validator: Validator.phone,
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
