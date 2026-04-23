import 'package:flutter/material.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/helpers/validator.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/core/values/app_strings.dart';
import 'package:online_exam/features/auth/domain/entities/user_entity.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              label: Text(AppStrings.userName),
              hintText: AppStrings.enterYouUserName,
            ),
            initialValue: user.username ?? "",

            validator: Validator.name,

            keyboardType: TextInputType.name,
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: user.firstName ?? "",

                  decoration: InputDecoration(
                    label: Text(AppStrings.firstName),
                    hintText: AppStrings.enterFirstName,
                  ),

                  // controller: firstNameController,
                  validator: Validator.name,

                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(width: MyResponsive.width(value: 17)),
              Expanded(
                child: TextFormField(
                  initialValue: user.lastName ?? "",

                  decoration: InputDecoration(
                    label: Text(AppStrings.lastName),
                    hintText: AppStrings.enterLastName,
                  ),

                  // controller: lastNameController,
                  validator: Validator.name,

                  keyboardType: TextInputType.name,
                ),
              ),
            ],
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          TextFormField(
            initialValue: user.email ?? "",

            decoration: InputDecoration(
              label: Text(AppStrings.email),
              hintText: AppStrings.enterYouEmail,
            ),

            // controller: emailController,
            validator: Validator.email,

            keyboardType: TextInputType.emailAddress,
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          TextFormField(
            initialValue: '555555555',
            decoration: InputDecoration(
              suffix: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.changePasswordRoute);
                },
                child: Text(
                  'Change',
                  style: AppTextStyles.semiBold12.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),

              label: Text(AppStrings.password),
              hintText: AppStrings.enterYouPassword,
            ),

            // controller: passwordController,
            validator: Validator.password,
            obscuringCharacter: '★',
            style: AppTextStyles.regular16.copyWith(
              color: AppColors.passwordGray,
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),

          SizedBox(height: MyResponsive.height(value: 28)),

          TextFormField(
            initialValue: user.phone ?? "",

            decoration: InputDecoration(
              label: Text(AppStrings.phoneNumber),
              hintText: AppStrings.enterPhoneNumber,
            ),

            // controller: phoneController,
            validator: Validator.phone,

            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
