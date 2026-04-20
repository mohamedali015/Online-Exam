import 'package:flutter/material.dart';
import 'package:online_exam/config/route_manager/routes.dart';
import 'package:online_exam/core/helpers/my_responsive.dart';
import 'package:online_exam/core/helpers/validator.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_text_styles.dart';
import 'package:online_exam/core/values/app_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController userNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("Profile"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: MyResponsive.paddingSymmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentGeometry.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/png/exam.png'),
                      radius: MyResponsive.radius(value: 55),
                    ),
                    Padding(
                      padding: MyResponsive.paddingOnly(bottom: 3, start: 3),
                      child: Container(
                        height: MyResponsive.height(value: 30),
                        width: MyResponsive.width(value: 30),
                        decoration: BoxDecoration(
                          color: AppColors.changeProfilePhotoblue,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.baseWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MyResponsive.height(value: 40)),
                Form(
                  key: formKey,

                  child: Column(
                    children: [
                      TextFormField(
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
                        decoration: InputDecoration(
                          suffix: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.changePasswordRoute,
                              );
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
                ),
                SizedBox(height: MyResponsive.height(value: 40)),
                ElevatedButton(onPressed: () {}, child: Text('Update')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
